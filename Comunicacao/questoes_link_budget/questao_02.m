clc;
clear;

% 2. O artigo em [1] apresenta os seguintes parˆametros de c´alculo de enlace para um sistema 6G:
% Assuma que uma SNR de 10 dB seja necess´aria para um enlace confi´avel. Trˆes frequˆencias
% podem ser utilizadas para comunica¸c˜ao: 1,8 GHz, 3,5 GHz e 7 GHz. Levando em conta os
% parˆametros de c´alculo de enlace e para cada uma destas frequˆencias:

eirp_dBm = 62;                  %Pt+Gt
eipr = 10^((eirp_dBm-30)/10);   %Pt*Gt
PSD_dBm = -174;                 %PSD do ruido
PSD = 10^((PSD_dBm-30)/10);
Gr_dB = 6;
Gr = 10^(Gr_dB/10);
fig_N0_dB = 5;                  %figura demerito SNRin/SNRout
fig_N0 = 10^(fig_N0_dB/10);
snr_dB = 10;
snr = 10^(snr_dB/10);
BW = 10*10e6;

% (a) Calcule a sensibilidade deste receptor, ou seja, a mınima potencia de recepcao para obter
% a SNR desejada.

P_N0_dB = PSD_dBm-30 + 10*log10(BW); %ruido termico N0 = kT(PSD)+ BW + fig_N0
P_N0 = PSD*BW;
Pr = P_N0*snr*fig_N0;
Pr_dB = P_N0_dB + snr_dB + fig_N0_dB

%A sensibilidade do receptor é de Pr = -109dB

% (b) Levando em conta a sensibilidade calculada no item anterior, qual a distancia maxima
% entre transmissor e receptor que pode ser utilizada considerando o modelo logdistancia
% em um ambiente urbano?

c = 299792458;
n_urbano = 4;
d0 = 1;
PL = eipr*Gr/Pr;
PL_dB = 10*log10(PL);

%1.8G
f_1 = 1.8*10^9;
lambda_1 = c/f_1;
PL_d0_1 = (16*pi^2*d0^2)/(lambda_1^2);
PL_d0_dB_1 = 10*log10(PL_d0_1);
d_1 = (PL/PL_d0_1)^(1/4)
d_1 = 10^((PL_dB-PL_d0_dB_1)/40)

%3.5G
f_2 = 3.5*10^9;
lambda_2 = c/f_2;
PL_d0_2 = (16*pi^2*d0^2)/(lambda_2^2);
PL_d0_dB_2 = 10*log10(PL_d0_2);
d_2 = (PL/PL_d0_2)^(1/4)
%d_2 = 10^((PL_dB-PL_d0_dB_2)/40)

%7G
f_3 = 7*10^9;
lambda_3 = c/f_3;
PL_d0_3 = (16*pi^2*d0^2)/(lambda_3^2);
PL_d0_dB_3 = 10*log10(PL_d0_3);
d_3 = (PL/PL_d0_3)^(1/4)
%d_3 = 10^((PL_dB-PL_d0_dB_3)/40)
