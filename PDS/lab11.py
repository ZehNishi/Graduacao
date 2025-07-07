import numpy as np
import matplotlib.pyplot as plt
import pds

w = np.array([1,2,3,4,5])*np.pi/5
A=[1,3,5,4,2]
M = 1000

h = pds.multifaixa(w,A,M)
m = np.arange(M+1)
w = np.linspace(0, np.pi,1024)
w, H = pds.dftt(m, h, w)
plt.plot(w/np.pi, np.abs(H))
