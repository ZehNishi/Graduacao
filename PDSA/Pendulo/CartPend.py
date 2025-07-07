import numpy as np
import matplotlib.pyplot as plt
from time import time

M = 0.5  # kg mass of the cart
m = 0.2  # kg mass of the pendulum
b = 10  # coefficient of friction for cart
l = 0.3  # length of the pendulum
i = 0.006  # inertia of the pendulum
g = -9.81  # acceleration due to gravity
c = 0.1  # coefficient of friction for pendulum
F = 0.0  # external force applied to the cart

# Simulation parameters
Dt = 0.05  # time step
Lt = 40  # total time
Nt = round(Lt / Dt)  # number of time steps
t = np.arange(Nt) * Dt  # time array

alpha = (M + m) / Dt**2 + b / Dt
beta = 2 * (M + m) / Dt**2 + b / Dt
gamma = (M + m) / Dt**2
delta = l / Dt**2 + c / Dt
epsilon = 2 * l / Dt**2 + c / Dt

x = np.zeros(Nt)  # cart position
th = np.zeros(Nt)  # pendulum angle
x[:3] = 0  # initial position
th[:3] = np.pi - 0.01  # initial angle

# PID controller parameters for theta
xsp = np.zeros(Nt)  # x setpoint
ex = np.zeros(Nt)
xsp[round(Nt / 2) :] = 0  # x setpoint
Ex = 0.0  # error
Px = 0  # proportional gain
Ix = 0.0  # integral gain
Dx = 0.0  # derivative gain

# PID controller parameters for x
eth = np.zeros(Nt)
thsp = np.pi  # theta setpoint
Eth = 0.0  # error
Pth = 10  # proportional gain
Ith = 0.0  # integral gain
Dth = 0.0  # derivative gain


def coord(x, th):
    return [-x, -x + l * np.sin(th)], [0, -l * np.cos(th)]


# fig, ax = plt.subplots(1)
# ax.set_aspect(aspect="equal", adjustable="box")
# xlim = 30 * l
# ylim = 1.1 * l
# ax.set(xlim=(-xlim, xlim), ylim=(-ylim, ylim))
# line = ax.plot(*coord(x[0], th[0]), "-o")

t1 = time()

for nt in range(3, Nt):
    thp = (th[nt - 1] - th[nt - 3]) / (2 * Dt)
    thpp = (th[nt - 1] - 2 * th[nt - 2] + th[nt - 3]) / Dt**2
    xpp = (x[nt - 1] - 2 * x[nt - 2] + x[nt - 3]) / Dt**2

    x[nt] = (
        beta * x[nt - 1]
        - gamma * x[nt - 2]
        + m * l * thpp * np.cos(th[nt - 1])
        - m * l * thp**2 * np.sin(th[nt - 1])
        + F
    ) / alpha

    th[nt] = (
        epsilon * th[nt - 1]
        - (l / Dt**2) * th[nt - 2]
        + g * np.sin(th[nt - 1])
        + xpp * np.cos(th[nt - 1])
    ) / delta

    eth[nt] = th[nt] - thsp
    Eth += eth[nt] * Dt
    F = eth[nt] * Pth + Ith * Eth + Dth * eth[nt - 1] / Dt

    ex[nt] = x[nt] - xsp[nt]
    Ex += ex[nt] * Dt
    F -= ex[nt] * Px + Ix * Ex + Dx * ex[nt - 1] / Dt  # + 0.01 * np.random.randn()

    # line[0].set_data(*coord(x[nt], th[nt]))
    # ax.set_title(f"{t[nt]:.1f} s")
    # t2, t1 = t1, time()
    # delay = max(Dt - (t1 - t2), 1e-12)
    # plt.pause(delay)

plt.figure("Cart Position")
plt.plot(t, x)
plt.figure("Pendulum Angle")
plt.plot(t, th)
plt.pause(0)
