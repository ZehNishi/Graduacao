import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as ss


Lx = 10  # metro
Ly = 20  # metro
Lt = 0.1  # segundo

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

fs = 400
Ls = 0.005  # Duration of source signal
Ns = round(Ls / Dt)
t = np.arange(Nt) * Dt
e = np.zeros(Nt)
e[:Ns] = ss.windows.tukey(Ns)
s1 = e * np.cos(2 * np.pi * fs * t)
s2 = e * np.cos(2 * np.pi * fs * t)


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


for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[0, 0] += s1[nt]
    u[0, -1] += s2[nt]
    m[nt] = u[round(Ny / 2), :]
    if SHOW:
        im.set_data(u)
        plt.title(f"t={t[nt]:.4f}")
        plt.pause(1e-2)


plt.figure("Lido")
plt.imshow(m, aspect="auto", extent=(0, Lx, Lt, 0))

for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[0, 0] += s1[nt]
    m[nt] = u[round(Ny / 2), :]

plt.figure("Desejado")
plt.imshow(m, aspect="auto", extent=(0, Lx, Lt, 0))


theta_deg = np.arange(-90, 90 + 0.1, 0.1)
signal_aligned_best = None
variance_best = float("inf")
best_theta = None

for theta in theta_deg:
    theta_rad = np.radians(theta)
    signal_aligned = np.zeros(m.shape[0])

    for i in range(m.shape[1]):
        delay_seconds = (i * Dx * np.sin(theta_rad)) / c0
        delay_samples = round(delay_seconds / Dt)

        if delay_samples < m.shape[0]:
            aligned_signal = np.zeros_like(signal_aligned)
            if delay_samples >= 0:
                aligned_signal[delay_samples:] = m[: m.shape[0] - delay_samples, i]
            else:
                aligned_signal[: m.shape[0] + delay_samples] = m[-delay_samples:, i]
            signal_aligned += aligned_signal

    variance = np.var(signal_aligned)

    if variance < variance_best:
        variance_best = variance
        signal_aligned_best = signal_aligned
        best_theta = theta

best_theta = np.degrees(best_theta)
s1_norm = s1 / np.max(np.abs(s1))
aligned_norm_best = signal_aligned_best / np.max(np.abs(signal_aligned_best))
print(best_theta)
plt.figure("Comparação - Sinal original vs Melhor Alinhamento")
plt.plot(t, s1_norm, label="Sinal original (s1)")
plt.plot(t, aligned_norm_best, label=f"Sinal alinhado (theta={best_theta}°)")
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude (normalizada)")
plt.title("Comparação entre o sinal original e o sinal com melhor alinhamento")
plt.legend()
plt.grid(True)
plt.pause(0)
