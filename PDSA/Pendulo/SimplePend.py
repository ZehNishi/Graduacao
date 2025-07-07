import numpy as np
import matplotlib.pyplot as plt
from time import time


g = 9.81  # m/s^2
l = 1.0  # m
c = 1e-2
Lt = 20
Dt = 0.1  # s
Nt = round(Lt / Dt)
t = np.arange(Nt) * Dt

th = np.zeros(Nt)
th[0] = np.pi * 0.999  # rad
th[1] = th[0] - 0.1  # rad/s

a = 1 + c * Dt
b = -(Dt**2) * g / l


def coord(th):
    return [0, l * np.sin(th)], [0, -l * np.cos(th)]


fig, ax = plt.subplots(1)
ax.set_aspect(aspect="equal", adjustable="box")
xlim = 1.1 * l
ylim = 1.1 * l
ax.set(xlim=(-xlim, xlim), ylim=(-ylim, ylim))
line = ax.plot(*coord(th[0]), "-o")

t1 = time()
for nt in range(2, Nt):
    th[nt] = ((1 + a) * th[nt - 1] - th[nt - 2] + b * np.sin(th[nt - 1])) / a
    line[0].set_data(*coord(th[nt]))
    ax.set_title(f"{t[nt]:.1f} s")
    t2, t1 = t1, time()
    delay = max(Dt - (t1 - t2), 1e-12)
    plt.pause(delay)

plt.figure(2)
plt.plot(t, th)
plt.title("Pendulo Simple")
plt.pause(0)
