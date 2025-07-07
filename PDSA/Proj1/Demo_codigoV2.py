import numpy as np
import matplotlib.pyplot as plt
import scipy.signal as ss
import math
import librosa
from scipy.signal import resample


Lx = 20  # metro
Ly = 40  # metro
Lt = 30  # segundo

Dx = 0.05  # metro
Dy = 0.05  # metro
Dt = 0.0001  # segundo

Nx = round(Lx / Dx)
Ny = round(Ly / Dy)
Nt = round(Lt / Dt)

c0 = 340
c = c0 * np.ones((Ny, Nx))
c2 = Dt**2 / (Dx**2) * c**2
alpha = 100

u = np.zeros((Ny, Nx))
u_1 = np.zeros((Ny, Nx))
u_2 = np.zeros((Ny, Nx))

m = np.zeros((Nt, Nx))
m1 = np.zeros((Nt, Nx))
m2 = np.zeros((Nt, Nx))


fs_target = int(1 / Dt)  # 10 kHz
duracao_segundos = Lt

caminho1 = r"C:\Users\Jose\Documents\PDSA\Proj1\Nirvana.mp3"
caminho2 = r"C:\Users\Jose\Documents\PDSA\Proj1\GunsNRoses.mp3"

# Carregar com librosa
audio1, fs1 = librosa.load(caminho1, sr=None, mono=True, duration=Lt)
audio2, fs2 = librosa.load(caminho2, sr=None, mono=True, duration=Lt)

# Recorte de 30 segundos e reamostragem
Ns = round(duracao_segundos / Dt)
audio1 = resample(audio1[: fs1 * Lt], Ns)
audio2 = resample(audio2[: fs2 * Lt], Ns)

# Aplicar janela Tukey para suavizar bordas
janela = ss.windows.tukey(Ns, alpha=0.1)
# s1 = audio1 * janela
# s2 = audio2 * janela

s1 = audio1 / np.max(np.abs(audio1))
s2 = audio2 / np.max(np.abs(audio2))


SHOW = False
# SHOW = True
if SHOW:
    fig, ax = plt.subplots(num=1)
    vmm = 0.005
    im = ax.imshow(u, vmin=-vmm, vmax=vmm)


def lap(u):
    v = -4 * u
    v[:, 1:-1] += u[:, 2:] + u[:, :-2]
    v[1:-1, :] += u[2:, :] + u[:-2, :]
    return v


m_y = 300
s_x1 = 2
s_y1 = 50
s_x2 = -2
s_y2 = 20

from tqdm import trange

for nt in trange(2, Nt):
    u_1, u_2 = u, u_1
    u = ((2 + alpha * Dt) * u_1 - u_2 + c2 * lap(u_1)) / (1 + alpha * Dt)
    u[s_y1, s_x1] += s1[nt]
    u[s_y2, s_x2] += s2[nt]
    m[nt] = u[m_y, :]
    if SHOW:
        im.set_data(u)
        plt.title(f"t={t[nt]:.4f}")
        plt.pause(1e-2)

SNR = 0  # 10, 20, 30, 40
sigma_f = np.sqrt(np.mean(m**2))
sigma_w = np.sqrt(sigma_f**2 * 10 ** (-SNR / 10))
noise = sigma_w * np.random.randn(*m.shape)
m_clean = m
m = m + noise


microfone_x = np.arange(Nx)
microfone_y = np.full(Nx, m_y)
coordenadas_microfones = np.column_stack((microfone_x, microfone_y))
distancias = Dy * np.sqrt((microfone_x - s_x1) ** 2 + (microfone_y - s_y1) ** 2)
tempos_chegada = distancias / c0


m_alinhado = np.zeros_like(m)

for i in range(Nx):
    delay = int(np.floor((tempos_chegada[i] - tempos_chegada[0]) / Dt))
    if delay >= 0:
        if delay < Nt:
            m_alinhado[: Nt - delay, i] = m[delay:, i]
    else:
        delay = abs(delay)
        if delay < Nt:
            m_alinhado[Nt - delay :, i] = m[:delay, i]

import soundfile as sf

fs = int(1 / Dt)
meio = Nx // 2
sinal_central = m[:, meio]
sinal_central /= np.max(np.abs(sinal_central))

sinal_somado = np.sum(m_alinhado, axis=1)
sinal_somado /= np.max(np.abs(sinal_somado))

sf.write("microfone_central.wav", sinal_central, fs)
sf.write("soma_alinhada.wav", sinal_somado, fs)
