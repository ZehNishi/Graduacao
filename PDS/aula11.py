import numpy as np
import matplotlib.pyplot as plt
import pds


#def filtro(wc,M):
#    m = np.arange(M+1)
#    h = pds.sinc2(m-M/2, wc)
#    return h

def FiltroMult(w,a,M):
    m = np.arange(M+1)
    h = 0
    for i in range(len(w)):
        h += a[i]*pds.sinc2(m-M/2, w[i])
    return h

def plot(h):
    m = np.arange(len(h)+1)
    w=np.linspace(0, np.pi, 1024)
    w, H = pds.dftt(m, h, w)

    plt.plot(w/np.pi, np.abs(H))
    
    
    #plt.plot([0,wc/np.pi], [1,1])
    #plt.plot([wc/np.pi,wc/np.pi], [1,0])
    #plt.plot([wc/np.pi,1], [0,0])
    

w = [5*np.pi/5,4*np.pi/5,3*np.pi/5,2*np.pi/5,np.pi/5]
a = [1,1,1,-1,-1]
M = 100
h = FiltroMult(w, a, M)

plot(h)


