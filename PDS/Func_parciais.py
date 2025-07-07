import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as sig
import pds

b = [6, -10, 2]
a = [1, -3, 2]
r, p, k = sig.residuez(b, a)

print(r, p, k)
x = [-2, 20]
plt.stem(*pds.impz(b, a, n=np.arange(-2, 20)))