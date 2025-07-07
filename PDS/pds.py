import numpy as np
from scipy.signal import lfilter

def delta(n):
    return 1.*(n==0)

def u(n):
    return 1.*(n>=0)

def eqdif(b, a, x):
    b /= a[0]
    a /= a[0]
    y = np.zeros_like(x)
    
    for n in range(len(x)):
        for k in range(1, min(n+1,len(a))):
            y[n] -= a[k]*y[n-k]
            
        for k in range(min(n+1,len(b))):
            y[n] += b[k]*x[n-k]
    return y

def mse(x, y):
    return np.mean(np.abs(x-y)**2)

def impz(b, a, n=np.arange(-2, 11)):
    x = delta(n)
    y = lfilter(b, a, x)
    return n, y

def sinc2(n, wc):
    x = np.zeros(len(n))
    for i in range(0,len(n)):
        if n[i]!=0:
            x[i] = np.sin(wc*n[i])/(np.pi*n[i])
        else:
            x[i] = wc/np.pi
    return x

def dftt(n, x, w=np.linspace(-np.pi, np.pi, 512)):
    X = np.zeros(len(w), dtype=complex)
    for i in range(len(X)):
        for j in range(len(x)):
            X[i] += x[j]*np.exp(-1j*w[i]*n[j])
    return w, X


def notch(w0, r):
    c = (1-(1+r**2)*np.cos(w0)+r**2)/(2-2*np.cos(w0))
    a = c*np.array([1, -2*np.cos(w0), 1])
    b = c*np.array([1, -(1+r**2)*np.cos(w0), r**2])
    return b, a
    
def dftmtx(N):
    m = np.arange(N)
    n, k = np.meshgrid(m, m)
    return np.exp(-1j*2*np.pi*k*n/N)

def dft(x):
    N = len(x)
    X = np.zeros(N, dtype=complex)
    W = np.exp(-1j*2*np.pi/N)
    
    for k in range(N):
        for n in range(N):
            X[k] += x[n]*W**(k*n)
    
    return X
    
def fft(x):
    N = len(x)
    if N>1:
        Xe = fft(x[:-1:2])
        Xo = fft(x[1::2])
        X = np.zeros(N, dtype=complex)
        W = np.exp(-1j*2*np.pi/N)
        k = np.arange(0, N/2)
        X[:round(N/2)] = Xe + W**k*Xo
        X[round(N/2):] = Xe - W**k*Xo
        return X
        
    else:
    
    
        return x
    

def multifaixa(w, A, M):
    A.append(0)
    h = 0
    m = np.arange(M+1)
    for k in range(len(w)):
        h += (A[k]-A[k+1])*sinc2(m-M/2, w[k])
    
    return h
