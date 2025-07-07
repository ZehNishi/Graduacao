import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp
import scipy.linalg
import time

# Parâmetros físicos do sistema
M = 0.5  # kg (massa do carrinho)
m = 0.2  # kg (massa do pêndulo)
b_friction = 0.5  # Ns/m (coeficiente de atrito para o carrinho)
l = 0.3  # m (comprimento até o centro de massa do pêndulo)
I_pendulum_com = 0.006  # kg*m^2 (momento de inércia do pêndulo sobre seu CM)
g = 9.81  # m/s^2 (aceleração da gravidade)
c_friction = 0.1  # Nms/rad (coeficiente de atrito para o pêndulo)

# Constantes intermediárias para o cálculo das matrizes
J_p = I_pendulum_com + m * l**2
M_T = M + m
Delta = J_p * M_T - (m * l) ** 2

# Matriz de estado A
A = np.zeros((4, 4))
A[0, 1] = 1.0
A[1, 0] = (M_T * m * g * l) / Delta
A[1, 1] = -(M_T * c_friction) / Delta
A[1, 3] = -(m * l * b_friction) / Delta
A[2, 3] = 1.0
A[3, 0] = (m**2 * l**2 * g) / Delta
A[3, 1] = -(m * l * c_friction) / Delta
A[3, 3] = -(J_p * b_friction) / Delta

# Matriz de entrada B
B = np.zeros((4, 1))
B[1, 0] = (m * l) / Delta
B[3, 0] = J_p / Delta

# --- Projeto do Controlador LQR ---
q_phi = 1.0
q_phi_dot = 1.0
q_x = 1.0
q_x_dot = 1.0
R_control = 0.1

Q = np.diag([q_phi, q_phi_dot, q_x, q_x_dot])
R_mat = np.array([[R_control]])

P = scipy.linalg.solve_continuous_are(A, B, Q, R_mat)
K_lqr = np.linalg.inv(R_mat) @ B.T @ P


# Função do modelo em espaço de estados com controle LQR e setpoint variável
def state_space_model(t, x, A_matrix_arg, B_matrix_arg, K_matrix_arg):
    # x é o vetor de estado atual [phi, phi_dot, x_pos, x_pos_dot]
    current_x_pos_desired = 0.0
    if t < 10.0:
        current_x_pos_desired = 2.0
    else:
        current_x_pos_desired = -2.0

    # phi_des = 0, phi_dot_des = 0, x_pos_dot_des = 0
    x_s_desired = np.array([0.0, 0.0, current_x_pos_desired, 0.0])

    error = x - x_s_desired

    # Força de controle F = -K * erro
    u_control_scalar_array = -K_matrix_arg @ error  # + 2 * np.random.randn()
    u_control_col_vector = u_control_scalar_array.reshape(-1, 1)

    dxdt = A_matrix_arg @ x + (B_matrix_arg @ u_control_col_vector).flatten()
    return dxdt


# --- Parâmetros da Simulação ---
Dt = 0.05
Lt = 20.0
Nt = int(Lt / Dt) + 1
t_eval = np.linspace(0, Lt, Nt)

# --- Condições Iniciais ---
phi0 = np.pi
phi_dot0 = 0.0
x0 = 0.0
x_dot0 = 0.0
y0 = [phi0, phi_dot0, x0, x_dot0]

# --- Simulação usando solve_ivp com CONTROLE LQR e SETPOINT VARIÁVEL ---
sol = solve_ivp(
    state_space_model,  # 1. A função que define a dinâmica do sistema
    [0, Lt],  # 2. O intervalo de tempo da simulação
    y0,  # 3. As condições iniciais do sistema
    args=(A, B, K_lqr),  # 4. Argumentos extras para a sua função de modelo
    dense_output=True,  # 5. Para obter uma solução contínua (interpolada)
    t_eval=t_eval,  # 6. Pontos específicos no tempo para salvar a solução
)

# Extrair resultados da simulação
t_sim = sol.t
phi_sim = sol.y[0, :]
phi_dot_sim = sol.y[1, :]
x_pos_sim = sol.y[2, :]
x_pos_dot_sim = sol.y[3, :]

# Calcular a Força de Controle aplicada ao longo do tempo
F_applied = np.zeros_like(t_sim)
x_desired_signal_for_force_calc = np.zeros_like(t_sim)

for i in range(len(t_sim)):
    current_state_vector = sol.y[:, i]
    current_t_val = t_sim[i]

    current_x_pos_desired_at_t = 0.0
    if current_t_val < 10.0:
        current_x_pos_desired_at_t = 2.0
    else:
        current_x_pos_desired_at_t = -2.0
    x_desired_signal_for_force_calc[i] = (
        current_x_pos_desired_at_t  # Para plotar referência exata usada
    )

    x_s_desired_at_t = np.array([0.0, 0.0, current_x_pos_desired_at_t, 0.0])
    error_at_t = current_state_vector - x_s_desired_at_t
    F_applied[i] = (-K_lqr @ error_at_t)[0]


def get_pendulum_coords(cart_x, phi_angle, pendulum_length):

    pivot_x = cart_x

    pivot_y = 0.0  # Nível do pivô no eixo y
    phi_to_draw = -phi_angle

    mass_x = pivot_x + pendulum_length * np.sin(phi_to_draw)
    mass_y = pivot_y + pendulum_length * np.cos(phi_to_draw)
    return [pivot_x, mass_x], [pivot_y, mass_y]


# --- Animação ---
plt.ion()
fig_anim, ax_anim = plt.subplots(figsize=(12, 7))
ax_anim.set_aspect("equal", adjustable="box")
ax_anim.grid(True)

(line_pendulum,) = ax_anim.plot(
    [], [], "o-", lw=2, color="dodgerblue", markersize=8, markerfacecolor="gold"
)
cart_width = 0.4
cart_height = 0.2
cart_rect = plt.Rectangle(
    (y0[2] - cart_width / 2, -cart_height / 2),
    cart_width,
    cart_height,
    color="sandybrown",
    ec="black",
)
ax_anim.add_patch(cart_rect)

padding_x = 1.5  # Aumentar padding para acomodar movimento até +/- 2m
min_x_render = min(np.min(x_pos_sim), -2.0 - cart_width / 2) - padding_x
max_x_render = max(np.max(x_pos_sim), 2.0 + cart_width / 2) + padding_x
ax_anim.set_xlim(min_x_render, max_x_render)
ax_anim.set_ylim(-l * 1.2, l * 1.5)

time_anim_start = time.time()

for i in range(len(t_sim)):
    current_t_val = t_sim[i]
    current_x_val = x_pos_sim[i]
    current_phi_val = phi_sim[i]

    pendulum_coords_x, pendulum_coords_y = get_pendulum_coords(
        current_x_val, current_phi_val, l
    )
    line_pendulum.set_data(pendulum_coords_x, pendulum_coords_y)
    cart_rect.set_xy((current_x_val - cart_width / 2, -cart_height / 2))
    ax_anim.set_title(
        f"Pêndulo Invertido (LQR, Setpoint x Variável) - Tempo: {current_t_val:.2f} s"
    )
    plt.pause(Dt)
    if not plt.fignum_exists(fig_anim.number):
        break

time_anim_end = time.time()
plt.ioff()

# --- Gráficos Finais ---
plt.figure(
    "Posição do Carrinho (x) - Controlado com Setpoint Variável", figsize=(10, 6)
)
plt.plot(t_sim, x_pos_sim, label="x (posição real do carrinho)", color="green")
plt.plot(
    t_sim,
    x_desired_signal_for_force_calc,
    linestyle="--",
    color="black",
    label="Setpoint x_des(t)",
)
plt.xlabel("Tempo (s)")
plt.ylabel("Posição (m)")
plt.title("Rastreamento da Posição do Carrinho com LQR (Setpoint Variável)")
plt.grid(True)
plt.legend()

plt.figure("Força Controle (F) - LQR + N", figsize=(10, 6))
plt.plot(t_sim, F_applied, label="Força F(t)", color="red")
plt.xlabel("Tempo (s)")
plt.ylabel("Força (N)")
plt.title("Força Controle (LQR + Pré-Compensador N)")
plt.grid(True)
plt.legend()

plt.figure(
    "Ângulo do Pêndulo (phi) - Controlado com Setpoint Variável", figsize=(10, 6)
)
plt.plot(t_sim, phi_sim, label="phi (ângulo do pêndulo)", color="purple")
plt.axhline(0, color="black", lw=0.5, ls="--", label="Setpoint phi=0")
plt.xlabel("Tempo (s)")
plt.ylabel("Ângulo (rad)")
plt.title("Estabilização do Ângulo do Pêndulo com LQR (Setpoint Variável de x)")
plt.grid(True)
plt.legend()

plt.show()
