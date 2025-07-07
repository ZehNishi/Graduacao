clc;
clear;
% 1.Considere um enlace de comunicacao de banda passante com uma largura de banda
% de 1,5 MHz e com um Pr/N0 disponıvel = 82 dB Hz. A taxa m´axima de erro de bit ´e 10−6.

BW = 1.5*10^6;
Pr_N0_dB = 82;
Pr_N0 = 10^(Pr_N0_dB/10);
ber = 10^-6;

% (a) Se a modulacao for 16-PSK usando um filtro raiz de cosseno levantado com α = 0,5, qual
%  a taxa de bits maxima alcancavel um enlace? Este é um canal limitado por potencia ou por largura de banda?

alpha_a = 0.5;
Rs_a = BW/(1+alpha_a);
M_a = 16;
n_a = log2(M_a);
Rb_a = n_a*Rs_a

snr_dB_16psk = 18.45;
snr_16psk = 10^(snr_dB_16psk/10);
Rb_16psk = Pr_N0/snr_16psk

% Como Rb_a = 4e06[Hz] (calculado pela banda) e Rb_16psk = 2.2646e06[Hz] (calculado pela potencia)
% O canal é limitado por potência.

% (b) Se a modula¸c˜ao for 16-QAM quadrada usando um filtro raiz de cosseno levantado com α
% = 0,5, qual ´e a taxa de bits m´axima alcan¸c´avel nesta enlace? Este ´e um canal limitado
% por potˆencia ou por largura de banda?

alpha_b = 0.5;
Rs_b = BW/(1+alpha_b);
M_b = 16;
n_b = log2(M_b);
Rb_b = n_b*Rs_b

snr_dB_16qam = 14.4;
snr_16qam = 10^(snr_dB_16qam/10);
Rb_16qam = Pr_N0/snr_16qam

% Como Rb_a = 4e06[Hz] (calculado pela banda) e Rb_16qam = 5.7544e06[Hz] (calculado pela potencia)
% O canal é limitado por banda.