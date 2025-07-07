import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as sig

N = 256
n = np.arange(N)
w0 = np.pi/50
x_clean = np.cos(w0*n)
x = x_clean + np.random.randn(N)

M = 30

a = np.ones(1)
b = np.ones(M)/(M+1)  # Alterar para um filtro de média móvel com M = 30
y = sig.lfilter(b, a, x)
plt.plot(n, x, n, y, n, x_clean)
