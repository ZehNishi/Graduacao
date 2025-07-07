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

fs1 = 400
fs2 = 250
Ls = 0.008  # Duration of source signal
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
s_x2 = -2
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

SNR = 10  # 10, 20, 30, 40
sigma_f = np.sqrt(np.mean(m**2))
sigma_w = np.sqrt(sigma_f**2 * 10 ** (-SNR / 10))
noise = sigma_w * np.random.randn(*m.shape)
m_clean = m
m = m + noise


microfone_x = np.arange(Nx)
microfone_y = np.full(Nx, m_y)
coordenadas_microfones = np.column_stack((microfone_x, microfone_y))
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0


m_alinhado = np.zeros_like(m)

for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 1
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0


m_alinhado_amostra1 = np.zeros_like(m)

for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra1[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra1[Nt - delay :, i] = m[:delay, i]


s_x1 = s_x1 + 2
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0


m_alinhado_amostra2 = np.zeros_like(m)

for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra2[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra2[Nt - delay :, i] = m[:delay, i]


s_x1 = s_x1 + 3
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra3 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra3[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra3[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 4
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra4 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra4[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra4[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 5
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra5 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra5[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra5[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 7
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra6 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra6[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra6[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 10
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra7 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra7[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra7[Nt - delay :, i] = m[:delay, i]

s_x1 = s_x1 + 15
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0

m_alinhado_amostra8 = np.zeros_like(m)
for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado_amostra8[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado_amostra8[Nt - delay :, i] = m[:delay, i]


s1_norm = s1 / np.max(np.abs(s1))
m_alinhado_sum = np.sum(m_alinhado, axis=1)
m_alinhado_norm = m_alinhado_sum / np.max(np.abs(m_alinhado_sum))

m_alinhado_amostra1 = np.sum(m_alinhado_amostra1, axis=1)
m_alinhado_amostra1 = m_alinhado_amostra1 / np.max(np.abs(m_alinhado_amostra1))
m_alinhado_amostra2 = np.sum(m_alinhado_amostra2, axis=1)
m_alinhado_amostra2 = m_alinhado_amostra2 / np.max(np.abs(m_alinhado_amostra2))
m_alinhado_amostra3 = np.sum(m_alinhado_amostra3, axis=1)
m_alinhado_amostra3 = m_alinhado_amostra3 / np.max(np.abs(m_alinhado_amostra3))
m_alinhado_amostra4 = np.sum(m_alinhado_amostra4, axis=1)
m_alinhado_amostra4 = m_alinhado_amostra4 / np.max(np.abs(m_alinhado_amostra4))
m_alinhado_amostra5 = np.sum(m_alinhado_amostra5, axis=1)
m_alinhado_amostra5 = m_alinhado_amostra5 / np.max(np.abs(m_alinhado_amostra5))
m_alinhado_amostra6 = np.sum(m_alinhado_amostra6, axis=1)
m_alinhado_amostra6 = m_alinhado_amostra6 / np.max(np.abs(m_alinhado_amostra6))
m_alinhado_amostra7 = np.sum(m_alinhado_amostra7, axis=1)
m_alinhado_amostra7 = m_alinhado_amostra7 / np.max(np.abs(m_alinhado_amostra7))
m_alinhado_amostra8 = np.sum(m_alinhado_amostra8, axis=1)
m_alinhado_amostra8 = m_alinhado_amostra8 / np.max(np.abs(m_alinhado_amostra8))


fig1, axs1 = plt.subplots(3, 3, figsize=(8, 6))
axs1 = axs1.flatten()

# Microfones somados
axs1[0].plot(t, s1_norm, "b", label="Sinal original")
axs1[0].plot(t, m_alinhado_norm)
axs1[0].set_title("Sem erro")
axs1[0].set_xlabel("Tempo (s)")
axs1[0].set_ylabel("Amplitude (normalizada)")
axs1[0].grid(True)

# Microfones somados
axs1[1].plot(t, s1_norm, "b", label="Sinal original")
axs1[1].plot(t, m_alinhado_amostra1)
axs1[1].set_title("Erro de 1m")
axs1[1].set_xlabel("Tempo (s)")
axs1[1].set_ylabel("Amplitude (normalizada)")
axs1[1].grid(True)

# Microfones somados
axs1[2].plot(t, s1_norm, "b", label="Sinal original")
axs1[2].plot(t, m_alinhado_amostra2)
axs1[2].set_title("Erro de 2m")
axs1[2].set_xlabel("Tempo (s)")
axs1[2].set_ylabel("Amplitude (normalizada)")
axs1[2].grid(True)

# Microfones somados
axs1[3].plot(t, s1_norm, "b", label="Sinal original")
axs1[3].plot(t, m_alinhado_amostra3)
axs1[3].set_title("Erro de 3m")
axs1[3].set_xlabel("Tempo (s)")
axs1[3].set_ylabel("Amplitude (normalizada)")
axs1[3].grid(True)

# Microfones somados
axs1[4].plot(t, s1_norm, "b", label="Sinal original")
axs1[4].plot(t, m_alinhado_amostra4)
axs1[4].set_title("Erro de 4m")
axs1[4].set_xlabel("Tempo (s)")
axs1[4].set_ylabel("Amplitude (normalizada)")
axs1[4].grid(True)

# Microfones somados
axs1[5].plot(t, s1_norm, "b", label="Sinal original")
axs1[5].plot(t, m_alinhado_amostra5)
axs1[5].set_title("Erro de 5m")
axs1[5].set_xlabel("Tempo (s)")
axs1[5].set_ylabel("Amplitude (normalizada)")
axs1[5].grid(True)

# Microfones somados
axs1[6].plot(t, s1_norm, "b", label="Sinal original")
axs1[6].plot(t, m_alinhado_amostra6)
axs1[6].set_title("Erro de 7m")
axs1[6].set_xlabel("Tempo (s)")
axs1[6].set_ylabel("Amplitude (normalizada)")
axs1[6].grid(True)

# Microfones somados
axs1[7].plot(t, s1_norm, "b", label="Sinal original")
axs1[7].plot(t, m_alinhado_amostra7)
axs1[7].set_title("Erro de 10m")
axs1[7].set_xlabel("Tempo (s)")
axs1[7].set_ylabel("Amplitude (normalizada)")
axs1[7].grid(True)

# Microfones somados
axs1[8].plot(t, s1_norm, "b", label="Sinal original")
axs1[8].plot(t, m_alinhado_amostra8)
axs1[8].set_title("Erro de 15m")
axs1[8].set_xlabel("Tempo (s)")
axs1[8].set_ylabel("Amplitude (normalizada)")
axs1[8].grid(True)


plt.tight_layout()
plt.show()
