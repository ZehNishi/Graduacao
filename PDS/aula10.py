import numpy as np
import pds

np.set_printoptions(suppress=True)

x = np.array([7.,5.,9.,3.])
xe = x[0::2]
xo = x[1::2]

Xe = pds.dft(xe)
Xo = pds.dft(xo)

X = pds.dft(x)
