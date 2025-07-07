import numpy as np
import matplotlib.pyplot as plt
import pds

N = 20
n = np.arange(-N, N)
w0 = 2*np.pi/6
x = np.cos(w0*n)

fig, axs = plt.subplots(2, 2)
axs[0,0].stem(n,x)
axs[0,0].grid()
axs[0,0].set_xlabel("$n$")
axs[0,0].set_ylabel("$x[n]$")

L = 10
w = 1*((n >= -L) & (n < L))

axs[1,0].stem(n,w)
axs[1,0].grid()
axs[1,0].set_xlabel("$n$")
axs[1,0].set_ylabel("$w[n]$")

K = 512
o = np.linspace(-np.pi, np.pi, K)
X = np.zeros(o.shape)
X[np.argmin(np.abs(o-w0))] = np.pi
X[np.argmin(np.abs(o+w0))] = np.pi


axs[0,1].plot(o,X)
axs[0,1].grid()
axs[0,1].set_xlabel("$\omega$")
axs[0,1].set_ylabel("$X(e^{j\omega})$")


o,Wn = pds.dftt(n, w, o)
Wa = np.sin(o*L)/np.sin(o/2)
#axs[1,1].plot(o,Wn)
axs[1,1].plot(o,Wa)
axs[1,1].grid()
axs[1,1].set_xlabel("$w$")
axs[1,1].set_ylabel("$W(e^{j\omega})$")

fig, axs = plt.subplots(2, 2)
axs[0,0].stem(n,x*w)
axs[0,0].grid()
axs[0,0].set_xlabel("$n$")
axs[0,0].set_ylabel("$x[n]*w[n]$")

Wa2 = (np.sin((o-np.pi/3)*L)/np.sin((o-np.pi/3)/2) + np.sin((o+np.pi/3)*L)/np.sin((o+np.pi/3)/2))/2

axs[0,1].plot(o,Wa2)
axs[0,1].grid()
axs[0,1].set_xlabel("$\omega$")
axs[0,1].set_ylabel("$X(e^{j\omega})*W(e^{j\omega})$")

xdft=x*w
xdft[w==0]=np.nan
xdft[0]=0
xdft[-1]=0

axs[1,0].stem(n,xdft)
axs[1,0].grid()
axs[1,0].set_xlabel("$n$")
axs[1,0].set_ylabel("$x_{dft}[n]$")

y = xdft[np.abs(xdft)>0]
Xdft = np.fft.fftshift(pds.dft(y))

axs[1,1].stem(np.arange(-10,10)/10*np.pi,np.abs(Xdft))
axs[1,1].plot(o,np.abs(Wa2),linestyle='dashed')
axs[1,1].grid()
axs[1,1].set_xlabel("$w=2\pi*k/N$")
axs[1,1].set_ylabel("$|X(k)|$")
