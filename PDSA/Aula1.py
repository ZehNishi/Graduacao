import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as ss
from tqdm import tqdm

Lx = 8  # metro
Ly = 8  # metro
Lt = 0.07  # segundo

Dx = 0.05  # metro
Dy = 0.05  # metro
Dt = 0.0001  # segundo

Nx = round(Lx / Dx)
Ny = round(Ly / Dy)
Nt = round(Lt / Dt)

Nm = Nx

c0 = 340
c = c0 * np.ones((Ny, Nx))
x, y = np.meshgrid(np.arange(Nx) * Dx, np.arange(Ny) * Dy)
xc = Lx / 3
yc = Ly / 3
rc = 0.5
c[Ny - 5, :] = 0
c[(x - xc) ** 2 + (y - yc) ** 2 < rc**2] = 0
# c[round(Ny / 2), :] = 0
# c[round(Ny / 2), round(Nx / 2)] = c0
c2 = Dt**2 / (Dx**2) * c**2
alpha = 100

# u = np.zeros((Nt,Ny,Nx))
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
# s = e * np.cos(2 * np.pi * fs * t)
t0 = 2 / fs
s = ss.gausspulse(t - t0, fs, bw=0.8)


SHOW = False
# SHOW = True
if SHOW:
    fig, ax = plt.subplots(num=1)
    vmm = 0.005
    im = ax.imshow(u, vmin=-vmm, vmax=vmm)
    # plt.show()


def lap(u):
    v = -4 * u
    v[:, 1:-1] += u[:, 2:] + u[:, :-2]
    v[1:-1, :] += u[2:, :] + u[:-2, :]
    return v


for nm in tqdm(range(Nm)):
    u = np.zeros((Ny, Nx))
    u_1 = np.zeros((Ny, Nx))
    u_2 = np.zeros((Ny, Nx))
    for nt in range(2, Nt):
        u_1, u_2 = u, u_1
        # u = 2 * u_1 - u_2 + c2 * lap(u_1)
        u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
        # u[0, round(Nx / 2)] += s[nt]  # source term
        u[0, nm] += s[nt]
        m[nt, nm] = u[1, nm]
        if SHOW:
            im.set_data(u)
            plt.title(f"t={t[nt]:.4f}")
            plt.pause(1e-2)

# plt.imshow(u)
# plt.show

# plt.figure()
# plt.plot(t, s, t, m / np.max(np.abs(m)))
# plt.pause(0)

plt.figure()
plt.imshow(m[2 * Ns :, 2:-2], aspect="auto", extent=(0, Lx, Lt, Lt - 2 * Ls))

# ref_mix = m[:, 1]

# m_sum = np.sum(m, axis=1)
# plt.plot(t, s, t, m_sum / np.max(np.abs(m_sum)))
# plt.pause(0)

f = np.zeros((Nx, Ny))
for nx in range(Nx):
    for ny in range(20, Ny):
        for nsx in range(Nx):
            d = np.sqrt((nx - nsx) ** 2 + (ny) ** 2) * Dx
            tau = round((2 * d / c0 + t0) / Dt)
            if tau < Nt:
                f[ny, nx] += m[tau, nsx]

plt.figure()
plt.imshow(f)
plt.pause(0)
