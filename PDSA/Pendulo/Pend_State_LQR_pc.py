import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp
import scipy.linalg  # Para LQR (solve_continuous_are)
import time

# Parâmetros físicos do sistema
M = 0.5
m = 0.2
b_friction = 0.1
l = 0.3
I_pendulum_com = 0.006
g = 9.81
c_friction = 0.1

# Constantes intermediárias
J_p = I_pendulum_com + m * l**2
M_T = M + m
Delta = J_p * M_T - (m * l) ** 2

if np.abs(Delta) < 1e-9:
    raise ValueError("Delta é muito pequeno, verifique os parâmetros.")

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

print("--- Representação em Espaço de Estados ---")
print("Matriz A (usada para o projeto do LQR):")
print(A)
print("\nMatriz B:")
print(B)
print("----------------------------------------")

# --- Projeto do Controlador LQR ---
q_phi = 100.0
q_phi_dot = 1.0
q_x = 30.0
q_x_dot = 1.0  # Aumentado q_x
R_control = 0.005  # Reduzido R para permitir mais controle

Q = np.diag([q_phi, q_phi_dot, q_x, q_x_dot])
R_mat = np.array([[R_control]])

n_states = A.shape[0]
control_matrix = B
for i in range(1, n_states):
    control_matrix = np.hstack((control_matrix, np.linalg.matrix_power(A, i) @ B))

K_lqr = np.zeros((1, 4))  # Default K_lqr
N_precompensador = 0.0  # Default N

rank_Co = np.linalg.matrix_rank(control_matrix)
if rank_Co != n_states:
    print(
        f"ALERTA: O sistema pode não ser completamente controlável! Posto={rank_Co}, Estados={n_states}"
    )
else:
    print("O sistema é controlável.")
    try:
        P = scipy.linalg.solve_continuous_are(A, B, Q, R_mat)
        K_lqr = np.linalg.inv(R_mat) @ B.T @ P
        print("\nMatriz de Ganho LQR K:")
        print(K_lqr)

        # --- Calcular Ganho de Pré-Compensação N ---
        A_cl = A - B @ K_lqr  # Matriz do sistema em malha fechada A-BK

        # Verificar estabilidade de A_cl (opcional, mas bom)
        eig_A_cl, _ = np.linalg.eig(A_cl)
        if np.all(
            np.real(eig_A_cl) < -1e-9
        ):  # Permitir pequena margem para erros numéricos
            print("Sistema em malha fechada (A-BK) é estável.")
        else:
            print(
                "ALERTA: Sistema em malha fechada (A-BK) NÃO é estável. Autovalores:",
                eig_A_cl,
            )
            print(
                "O pré-compensador N pode não funcionar como esperado ou o LQR precisa de ajuste."
            )

        H_vec = -np.linalg.inv(A_cl) @ B  # H_vec é 4x1

        if (
            abs(H_vec[2, 0]) > 1e-6
        ):  # Evitar divisão por zero se x não for controlável por F em DC
            N_precompensador = 1.0 / H_vec[2, 0]
            print(f"Ganho de Pré-Compensação N calculado: {N_precompensador:.4f}")
        else:
            print(
                "ALERTA: Ganho DC H_vec[2,0] é próximo de zero. Não foi possível calcular N."
            )
            # Tentativa de usar K_lqr[0,2] como um substituto se for razoável
            if abs(K_lqr[0, 2]) > 1e-4:
                N_precompensador = K_lqr[0, 2] * np.sign(
                    H_vec[2, 0]
                )  # Heurística, pode precisar de ajuste
                print(
                    f"Usando N_precompensador heurístico baseado em K_lqr[0,2] = {N_precompensador:.4f}."
                )
            else:  # Se K_lqr[0,2] também for muito pequeno
                N_precompensador = (
                    1.0  # Último recurso, provavelmente precisará de ajuste manual
                )
                print(
                    f"Usando N_precompensador = 1.0 como fallback. Pode precisar de ajuste."
                )
            print(
                "Considere ajustar Q/R ou usar a lei de controle baseada no erro total x_s - x_s_desejado se o rastreamento falhar."
            )

    except np.linalg.LinAlgError as e:
        print(f"Erro de Álgebra Linear ao calcular LQR ou N_precompensador: {e}")
        print("Usando K_lqr e N_precompensador nulos.")
    except Exception as e:
        print(f"Erro desconhecido ao calcular LQR ou N_precompensador: {e}")
        print("Usando K_lqr e N_precompensador nulos.")

print("----------------------------------------")


# Função do modelo em espaço de estados com controle LQR, setpoint variável e pré-compensador N
def state_space_model_precomp(
    t, y, A_matrix_arg, B_matrix_arg, K_matrix_arg, N_precomp_arg
):
    current_x_pos_desired = 2.0 if t < 10.0 else -2.0

    # Lei de controle: F = N * x_desejado_posicao - K * estado_completo
    # (K_matrix_arg @ y)[0] é K_lqr * y (produto escalar)
    force_f = N_precomp_arg * current_x_pos_desired - (K_matrix_arg @ y)[0]
    u_control_col_vector = np.array([[force_f]])  # Tornar (1,1) para B @ u

    dydt = A_matrix_arg @ y + (B_matrix_arg @ u_control_col_vector).flatten()
    return dydt


# --- Parâmetros da Simulação ---
Dt = 0.05
Lt = 20.0
Nt = int(Lt / Dt) + 1
t_eval = np.linspace(0, Lt, Nt)

# --- Condições Iniciais ---
phi0 = 0.05  # Pequena perturbação inicial no ângulo
phi_dot0 = 0.0
x0 = 0.0  # Carrinho começa em x=0
x_dot0 = 0.0
y0 = [phi0, phi_dot0, x0, x_dot0]

print(
    f"\nCondições Iniciais: phi={phi0} rad, phi_dot={phi_dot0} rad/s, x={x0} m, x_dot={x_dot0} m/s"
)

# --- Simulação ---
print("Iniciando simulação COM CONTROLE LQR e PRÉ-COMPENSADOR N...")
sol = solve_ivp(
    state_space_model_precomp,
    [0, Lt],
    y0,
    args=(A, B, K_lqr, N_precompensador),
    dense_output=True,
    t_eval=t_eval,
)
print("Simulação controlada concluída.")

# Extrair resultados
t_sim = sol.t
phi_sim = sol.y[0, :]
x_pos_sim = sol.y[2, :]

# Calcular Força de Controle e Sinal de Referência para plotagem
F_applied = np.zeros_like(t_sim)
x_desired_signal = np.zeros_like(t_sim)
for i in range(len(t_sim)):
    current_state_vector = sol.y[:, i]
    current_t_val = t_sim[i]
    current_x_pos_desired_at_t = 2.0 if current_t_val < 10.0 else -2.0
    x_desired_signal[i] = current_x_pos_desired_at_t
    F_applied[i] = (
        N_precompensador * current_x_pos_desired_at_t
        - (K_lqr @ current_state_vector)[0]
    )


def get_pendulum_coords(cart_x, phi_angle, pendulum_length):

    pivot_x = cart_x

    pivot_y = 0.0  # Nível do pivô no eixo y

    mass_x = pivot_x + pendulum_length * np.sin(phi_angle)
    mass_y = pivot_y + pendulum_length * np.cos(phi_angle)
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
padding_x = 1.5
min_x_render = min(np.min(x_pos_sim), -2.0 - cart_width / 2) - padding_x
max_x_render = max(np.max(x_pos_sim), 2.0 + cart_width / 2) + padding_x
ax_anim.set_xlim(min_x_render, max_x_render)
ax_anim.set_ylim(-l * 1.2, l * 1.5)
print("\nIniciando animação...")
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
        f"Pêndulo (LQR + Pré-Compensador N) - T: {current_t_val:.2f}s X_des: {x_desired_signal[i]:.1f}m"
    )
    plt.pause(Dt)
    if not plt.fignum_exists(fig_anim.number):
        break
time_anim_end = time.time()
print(f"Animação: {time_anim_end - time_anim_start:.2f}s.")
plt.ioff()

# --- Gráficos Finais ---
plt.figure("Posição Carrinho (x) - LQR + N", figsize=(10, 6))
plt.plot(t_sim, x_pos_sim, label="x (real)", color="green")
plt.plot(
    t_sim, x_desired_signal, linestyle="--", color="black", label="Setpoint x_des(t)"
)
plt.xlabel("Tempo (s)")
plt.ylabel("Posição (m)")
plt.title("Rastreamento Posição (LQR + Pré-Compensador N)")
plt.grid(True)
plt.legend()

plt.figure("Ângulo Pêndulo (phi) - LQR + N", figsize=(10, 6))
plt.plot(t_sim, phi_sim, label="phi (real)", color="purple")
plt.axhline(0, color="black", lw=0.5, ls="--", label="Setpoint phi=0")
plt.xlabel("Tempo (s)")
plt.ylabel("Ângulo (rad)")
plt.title("Estabilização Ângulo (LQR + Pré-Compensador N)")
plt.grid(True)
plt.legend()

plt.figure("Força Controle (F) - LQR + N", figsize=(10, 6))
plt.plot(t_sim, F_applied, label="Força F(t)", color="red")
plt.xlabel("Tempo (s)")
plt.ylabel("Força (N)")
plt.title("Força Controle (LQR + Pré-Compensador N)")
plt.grid(True)
plt.legend()

print("\nMostrando gráficos...")
plt.show()
print("Programa finalizado.")


# Definição da função get_pendulum_coords que estava faltando no contexto do script final
def get_pendulum_coords(cart_x, phi_angle, pendulum_length):
    pivot_x = cart_x
    pivot_y = 0.0
    mass_x = pivot_x + pendulum_length * np.sin(phi_angle)
    mass_y = pivot_y + pendulum_length * np.cos(phi_angle)
    return [pivot_x, mass_x], [pivot_y, mass_y]
