import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp
import scipy.linalg  # Para LQR (solve_continuous_are)
import time

# Parâmetros físicos do sistema
M = 0.5  # kg (massa do carrinho)
m = 0.2  # kg (massa do pêndulo)
b_friction = 0.1  # Ns/m (coeficiente de atrito para o carrinho)
l = 0.3  # m (comprimento até o centro de massa do pêndulo)
I_pendulum_com = 0.006  # kg*m^2 (momento de inércia do pêndulo sobre seu CM)
g = 9.81  # m/s^2 (aceleração da gravidade)
c_friction = 0.1  # Nms/rad (coeficiente de atrito para o pêndulo)

# Constantes intermediárias para o cálculo das matrizes
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

print("--- Matrizes do Sistema ---")
print("Matriz A:")
print(A)
print("\nMatriz B:")
print(B)
print("---------------------------")


# Função do modelo em espaço de estados com controle LQR e setpoint variável
def state_space_model_for_lqr(t, y, A_matrix, B_matrix, K_matrix):
    current_x_pos_desired = 2.0 if t < 10.0 else -2.0
    x_s_desired = np.array([0.0, 0.0, current_x_pos_desired, 0.0])
    error = y - x_s_desired
    u_control_scalar_array = -K_matrix @ error
    u_control_col_vector = u_control_scalar_array.reshape(-1, 1)
    dydt = A_matrix @ y + (B_matrix @ u_control_col_vector).flatten()
    return dydt


# Função para rodar uma simulação LQR com dados Q e R
def run_lqr_simulation(
    A_sys, B_sys, Q_diag_vals, R_val, y0_sim, t_span_sim, t_eval_sim
):
    Q_mat = np.diag(Q_diag_vals)
    R_mat_sim = np.array([[R_val]])
    K_lqr_sim = np.zeros((1, 4))  # Default

    try:
        P_sol = scipy.linalg.solve_continuous_are(A_sys, B_sys, Q_mat, R_mat_sim)
        K_lqr_sim = np.linalg.inv(R_mat_sim) @ B_sys.T @ P_sol
    except Exception as e:
        print(
            f"Erro ao calcular LQR para Q={Q_diag_vals}, R={R_val}: {e}. Usando K_lqr nulo."
        )

    sol = solve_ivp(
        state_space_model_for_lqr,
        t_span_sim,
        y0_sim,
        args=(A_sys, B_sys, K_lqr_sim),
        dense_output=True,
        t_eval=t_eval_sim,
    )

    t_result = sol.t
    phi_result = sol.y[0, :]
    x_pos_result = sol.y[2, :]

    # Gerar o sinal de referência x_desired(t) para plotagem
    x_desired_signal_result = np.zeros_like(t_result)
    for i, ti in enumerate(t_result):
        x_desired_signal_result[i] = 2.0 if ti < 10.0 else -2.0

    return t_result, x_pos_result, phi_result, x_desired_signal_result, K_lqr_sim


# --- Parâmetros da Simulação Comum ---
Dt_sim = 0.05
Lt_sim = 20.0
Nt_sim = int(Lt_sim / Dt_sim) + 1
t_eval_points = np.linspace(0, Lt_sim, Nt_sim)
t_span_points = [0, Lt_sim]

phi0_sim = 0.01
phi_dot0_sim = 0.0
x0_sim = 0.0
x_dot0_sim = 0.0
y0_conditions = [phi0_sim, phi_dot0_sim, x0_sim, x_dot0_sim]

# --- Configurações de Q e R para Comparação ---
R_control_fixed = 0.01

q_configurations = [
    {"label": "Q_diag = [1,1,1,1]", "q_diag": [1.0, 1.0, 1.0, 1.0]},
    {"label": "q_x=100, others=1", "q_diag": [1.0, 1.0, 100.0, 1.0]},
    {"label": "q_phi=100, others=1", "q_diag": [100.0, 1.0, 1.0, 1.0]},
    {"label": "q_phi=100, q_x=100, others=1", "q_diag": [100.0, 1.0, 100.0, 1.0]},
]

# --- Geração dos Plots ---
num_configs = len(q_configurations)
fig, axs = plt.subplots(
    num_configs, 2, figsize=(12, num_configs * 3.5), sharex=True
)  # Compartilhar eixo x
fig.suptitle(f"Comparação de Desempenho LQR com R={R_control_fixed}", fontsize=16)

for idx, config in enumerate(q_configurations):
    print(f"\nSimulando para: {config['label']}")
    t_res, x_res, phi_res, x_des_res, K_calc = run_lqr_simulation(
        A,
        B,
        config["q_diag"],
        R_control_fixed,
        y0_conditions,
        t_span_points,
        t_eval_points,
    )
    print(f"Ganhos K para {config['label']}: {K_calc}")

    # Plot da Posição do Carrinho (x)
    ax_x = axs[idx, 0]
    ax_x.plot(t_res, x_res, label="x (real)", color="green")
    ax_x.plot(
        t_res, x_des_res, linestyle="--", color="black", label="Setpoint x_des(t)"
    )
    ax_x.set_ylabel("Posição x (m)")
    ax_x.set_title(f"Posição Carrinho: {config['label']}")
    ax_x.grid(True)
    ax_x.legend(fontsize="small")

    # Plot do Ângulo do Pêndulo (phi)
    ax_phi = axs[idx, 1]
    ax_phi.plot(t_res, phi_res, label="phi (real)", color="purple")
    ax_phi.axhline(0, color="black", lw=0.5, ls="--", label="Setpoint phi=0")
    ax_phi.set_ylabel("Ângulo phi (rad)")
    ax_phi.set_title(f"Ângulo Pêndulo: {config['label']}")
    ax_phi.grid(True)
    ax_phi.legend(fontsize="small")

    if idx == num_configs - 1:  # Adicionar xlabel apenas na última linha
        ax_x.set_xlabel("Tempo (s)")
        ax_phi.set_xlabel("Tempo (s)")

plt.tight_layout(rect=[0, 0, 1, 0.96])  # Ajustar layout para o suptitle
print("\nMostrando gráficos comparativos...")
plt.show()
print("Programa finalizado.")
