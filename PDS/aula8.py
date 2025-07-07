import numpy as np
import pds
import matplotlib.pyplot as plt
np.set_printoptions(suppress=True)

N = 4
x = np.arange(N)
X = pds.dft(x)
print(X)

N = 8
n = np.arange(N)
x = 5 + 2*np.cos((np.pi/2)*n)
X = pds.dft(x)
print(X)

N = 12
n = np.arange(N)
x = 1 + 3*np.cos((np.pi/3)*n) + np.sin((5*np.pi/6)*n)
X = pds.dft(x)
print(X)

