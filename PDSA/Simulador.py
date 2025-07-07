import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as ss

Lx = 5  # metro
Ly = 10  # metro
Lt = 0.04  # segundo

Dx = 0.05  # metro
Dy = 0.05  # metro
Dt = 0.0001  # segundo

Nx = round(Lx / Dx)
Ny = round(Ly / Dy)
Nt = round(Lt / Dt)

c0 = 340
c = c0 * np.ones((Ny, Nx))
# c[round(Ny / 2), round(Nx / 2) - 5 : round(Nx / 2) + 5] = 0
# c[round(Ny / 2), :] = 0
# c[round(Ny / 2), round(Nx / 2)] = c0
c2 = Dt**2 / (Dx**2) * c**2
alpha = 100

# u = np.zeros((Nt,Ny,Nx))
u = np.zeros((Ny, Nx))
u_1 = np.zeros((Ny, Nx))
u_2 = np.zeros((Ny, Nx))

m = np.zeros((Nt, Nx))

fs = 1000
Ls = 0.01
Ns = round(Ls / Dt)
t = np.arange(Nt) * Dt
e = np.zeros(Nt)
e[:Ns] = ss.windows.tukey(Ns)
s = e * np.cos(2 * np.pi * fs * t)

SHOW = False
# SHOW = True
if SHOW:
    fig, ax = plt.subplots(num=1)
    vmm = 0.05
    im = ax.imshow(u, vmin=-vmm, vmax=vmm)
    # plt.show()


def lap(u):
    v = -4 * u
    v[:, 1:-1] += u[:, 2:] + u[:, :-2]
    v[1:-1, :] += u[2:, :] + u[:-2, :]
    return v


for nt in range(2, Nt):
    u_1, u_2 = u, u_1
    # u = 2 * u_1 - u_2 + c2 * lap(u_1)
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[0, round(Nx / 2)] += s[nt]  # source term
    m[nt] = u[round(2 * Ny / 3), :]
    if SHOW:
        im.set_data(u)
        plt.title(f"t={nt}")
        plt.pause(1e-2)

# plt.imshow(u)
# plt.show

# plt.figure()
# plt.plot(t, s, t, m / np.max(np.abs(m)))
# plt.pause(0)

plt.imshow(m, aspect="auto", extent=(0, Lx, Lt, 0))
plt.pause(0)
