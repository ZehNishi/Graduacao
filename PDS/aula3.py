
import numpy as np
import matplotlib.pyplot as plt
import pds


n = np.arange(-10, 31)
w1 = np.pi/10
x1 = np.cos(w1*n)

plt.figure(1)
plt.stem(n, x1)

w2 = w1 + 2*np.pi*17
x2 = np.cos(w2*n)

plt.figure(2)
plt.stem(n, x2)

print(pds.mse(x1, x2))