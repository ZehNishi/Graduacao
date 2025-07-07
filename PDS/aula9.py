import numpy as np
import matplotlib.pyplot as plt

def x(n):
    return np.cos(2*np.pi/9*n)+3/4*np.cos(4*np.pi/7*n)

N = 32
n = np.arange(N)
X32 = np.fft.fft(x(n))
#plt.figure()
#plt.stem(np.abs(X32/N))
K = 63
X32zp = np.fft.fft(x(n),K)
plt.figure()
plt.stem(np.abs(X32zp/N))


N = 63
n = np.arange(N)
X63 = np.fft.fft(x(n))
#plt.figure()
#plt.stem(np.abs(X63/N))


N = 200
n = np.arange(N)
X = np.fft.fft(x(n))
#plt.figure()
#plt.stem(np.abs(X/N))



