import numpy as np
import pds
import time
import matplotlib.pyplot as plt

np.set_printoptions(suppress=True)


M = 31
r = np.arange(M)
N = 2**r

tdft = np.zeros(M)
tfft = np.zeros(M)


for i in range(M):
    x = np.random.randn(N[i])
    
    start_time = time.time()
    #Xdft = pds.dft(x)
    Xdft = np.fft.fft(x)
    tdft[i] = time.time() - start_time
    
    start_time = time.time()
    #Xfft = pds.fft(x)
    tfft[i] = time.time() - start_time
    #print (pds.mse(Xdft, Xfft))    

plt.plot(N, tdft, N, tfft)
#plt.legend("DFT", "FFT")