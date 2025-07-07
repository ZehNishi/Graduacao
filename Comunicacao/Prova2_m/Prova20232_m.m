clc;
clear;

% 2. (4,0 pontos) Um dispositivo ´e configurado para uma taxa de transmiss˜ao de 1 Mbps. O
% transmissor deste sistema tem uma potˆencia efetivamente irradiada de transmiss˜ao de 30 dBm,
% enquanto o receptor tem uma antena de ganho de 0 dB. Este dispositivo est´a configurado para
% operar na frequˆencia de portadora de 2,4 GHz e com a modula¸c˜ao da quest˜ao 1, com uma
% BER m´ınima de 10−5. A densidade espectral de potˆencia do ru´ıdo ´e de -204 dBW/Hz.

Rb = 1e6;
EIRP_dBm = 30;
Gr_dB = 0;
fc = 2.4e9;
Pb = 10e-5;
PSD_dB = -204;
c = 299792458;

%  (1,0 pontos) Qual a distˆancia m´axima que podemos separar o transmissor do receptor
% considerando espa¸co livre?

%Pb = (1/3)*qfunc(sqrt((3/5)*snr))
snr = (5/3)*qfuncinv(3*Pb)^2;
snr_dB = 10*log10(snr);

M = 8;
Rs = Rb/log2(M);
B = Rs;

P_N0_dB = PSD_dB + 10*log10(Rb);
Pr_dB = snr_dB +P_N0_dB; %PSD_dB + 10*log10(Rb) == P_N0
PL_dB = (EIRP_dBm-30) + Gr_dB - Pr_dB;
PL = 10^(PL_dB/10);

lambda = c/fc;
d = sqrt((PL*lambda^2)/(16*pi^2))

%  (1,0 pontos) Repita o item anterior considerando agora o modelo log-distˆancia com n = 3.
d0 = 1;
n = 3;
PL_d0 = (16*pi^2*d0^2)/(lambda^2);
PL_d0_dB = 10*log10(PL_d0);
d = (PL/PL_d0)^(1/n)

%  (2,0 pontos) Vamos considerar agora que o dispositivo tem capacidade computacional
% para a opera¸c˜ao de um c´odigo corretor de erros operando no limite de Shannon. Qual a
% nova distˆancia m´axima poss´ıvel de opera¸c˜ao, considerando o modelo de espa¸co livre?

M = 8;
Rs = Rb/log2(M);
B = Rs;
C = Rb;

snr_dB_ = (B/C)*(2^(C/B)-1);
Pr_dB_ = P_N0_dB + snr_dB_;
PL_dB_ = (EIRP_dBm-30) + Gr_dB - Pr_dB_;
PL_ = 10^(PL_dB_/10);

d = sqrt((PL_*lambda^2)/(16*pi^2))