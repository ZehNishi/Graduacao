import numpy as np
import matplotlib.pyplot as plt
import pds

L = 11
w = np.linspace(-5*np.pi, 5*np.pi,num=1024)
X = np.exp(-1j*w*(L-1)/2)*np.sin(w*L/2)/np.sin(w/2)
plt.figure(1)
plt.plot(w/np.pi, np.abs(X))
#plt.figure(2)
#plt.plot(w/np.pi,np.angle(X))

#plt.figure(3)
n = np.arange(-10, 21)
x = pds.u(n) - pds.u(n-L)
#plt.stem(n, x)



w, Xn = pds.dftt(n, x, w=w)
plt.figure(4)
plt.plot(w/np.pi, np.abs(Xn))