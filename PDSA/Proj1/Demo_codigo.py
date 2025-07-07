import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as ss
import math


Lx = 20  # metro
Ly = 40  # metro
Lt = 0.08  # segundo

Dx = 0.05  # metro
Dy = 0.05  # metro
Dt = 0.0001  # segundo

Nx = round(Lx / Dx)
Ny = round(Ly / Dy)
Nt = round(Lt / Dt)

c0 = 340
c = c0 * np.ones((Ny, Nx))
c2 = Dt**2 / (Dx**2) * c**2
alpha = 100

u = np.zeros((Ny, Nx))
u_1 = np.zeros((Ny, Nx))
u_2 = np.zeros((Ny, Nx))

m = np.zeros((Nt, Nx))
m1 = np.zeros((Nt, Nx))
m2 = np.zeros((Nt, Nx))

fs1 = 400
fs2 = 250
Ls = 0.008
Ns = round(Ls / Dt)
t = np.arange(Nt) * Dt
e = np.zeros(Nt)
e[:Ns] = ss.windows.tukey(Ns)
s1 = e * np.cos(2 * np.pi * fs1 * t)
s2 = e * np.sin(2 * np.pi * fs2 * t)


SHOW = False
# SHOW = True
if SHOW:
    fig, ax = plt.subplots(num=1)
    vmm = 0.005
    im = ax.imshow(u, vmin=-vmm, vmax=vmm)


def lap(u):
    v = -4 * u
    v[:, 1:-1] += u[:, 2:] + u[:, :-2]
    v[1:-1, :] += u[2:, :] + u[:-2, :]
    return v


m_y = 300
s_x1 = 2
s_y1 = 50
s_x2 = 398
s_y2 = 20
for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[s_y1, s_x1] += s1[nt]
    u[s_y2, s_x2] += s2[nt]
    m[nt] = u[m_y, :]
    if SHOW:
        im.set_data(u)
        plt.title(f"t={t[nt]:.4f}")
        plt.pause(1e-2)

for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[s_y1, s_x1] += s1[nt]
    m1[nt] = u[m_y, :]

for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[s_y2, s_x2] += s2[nt]
    m2[nt] = u[m_y, :]

SNR = 10
sigma_f = np.sqrt(np.mean(m**2))
sigma_w = np.sqrt(sigma_f**2 * 10 ** (-SNR / 10))
noise = sigma_w * np.random.randn(*m.shape)
m_clean = m
m = m + noise


microfone_x = np.arange(Nx)
microfone_y = np.full(Nx, m_y)
coordenadas_microfones = np.column_stack((microfone_x, microfone_y))
distancias = Dy * np.sqrt((microfone_x - s_x2) ** 2 + (microfone_y - s_y2) ** 2)
tempos_chegada = distancias / c0


m_alinhado = np.zeros_like(m)

for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[-1]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado[delay:, i] = m[: Nt - delay, i]


s1_norm = s2 / np.max(np.abs(s2))
m_alinhado_sum = np.sum(m_alinhado, axis=1)
m_alinhado_norm = m_alinhado_sum / np.max(np.abs(m_alinhado_sum))

m_alinhado_amostra = m_alinhado[:, 0:400:10]

m_amostra = m[:, 0:400:10]

fig1, axs1 = plt.subplots(3, 1, figsize=(8, 6))

# Amostras dos microfones
axs1[0].plot(t, m_amostra)
axs1[0].set_title("Amostras dos Microfones")
axs1[0].set_xlabel("Tempo (s)")
axs1[0].set_ylabel("Amplitude (normalizada)")
axs1[0].grid(True)

# Amostras dos microfones alinhados
axs1[1].plot(t, m_alinhado_amostra)
axs1[1].set_title("Amostras dos Microfones Alinhados")
axs1[1].set_xlabel("Tempo (s)")
axs1[1].set_ylabel("Amplitude (normalizada)")
axs1[1].grid(True)

# Microfones somados
axs1[2].plot(t, s1_norm, "b", label="Sinal original")
axs1[2].plot(t, m_alinhado_norm, "r", label="Sinal alinhado")
axs1[2].set_title("Microfones Somados")
axs1[2].set_xlabel("Tempo (s)")
axs1[2].set_ylabel("Amplitude (normalizada)")
axs1[2].legend()
axs1[2].grid(True)

plt.tight_layout()

fig2, axs2 = plt.subplots(1, 3, figsize=(15, 4))

# Microfones lidos sem ruído
axs2[0].imshow(m_clean, aspect="auto")
axs2[0].set_title("Sem Ruído")
axs2[0].set_xlabel("Microfone")
axs2[0].set_ylabel("Tempo (s)")

# Microfones lidos com ruído
axs2[1].imshow(m, aspect="auto")
axs2[1].set_title("Com Ruído")
axs2[1].set_xlabel("Microfone")
axs2[1].set_ylabel("Tempo (s)")

# Microfones alinhados
axs2[2].imshow(m_alinhado, aspect="auto")
axs2[2].set_title("Alinhados")
axs2[2].set_xlabel("Microfone")
axs2[2].set_ylabel("Tempo (s)")

plt.tight_layout()

fig2, axs2 = plt.subplots(1, 2, figsize=(10, 4))
# Fonte 1
axs2[0].imshow(m1, aspect="auto")
axs2[0].set_title("Fonte 1")
axs2[0].set_xlabel("Microfone")
axs2[0].set_ylabel("Tempo (s)")

# Fonte 2
axs2[1].imshow(m2, aspect="auto")
axs2[1].set_title("Fonte 2")
axs2[1].set_xlabel("Microfone")
axs2[1].set_ylabel("Tempo (s)")

plt.tight_layout()
plt.show()
