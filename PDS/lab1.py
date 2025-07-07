import numpy as np
import matplotlib.pyplot as plt
import pds

n = np.arange(-5, 20)
x = pds.u(n)

alpha = .75
a = np.array([1., -alpha])
b = np.array([1.])

y = pds.eqdif(b, a, x)

plt.stem(n, y)
