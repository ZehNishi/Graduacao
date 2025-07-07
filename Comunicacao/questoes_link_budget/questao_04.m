clc;
clear;

% 4. A eterna busca por maior largura de banda leva os pesquisadores a investigar a faixa de
% frequˆencia dos terahertz para comunica¸c˜ao sem fio. Os seguintes parˆametros de um enlace
% de 100 Gbps a 10 m de distˆancia operando na frequˆencia de 300 GHz s˜ao inspirados nos
% apresentados em [3]:
% Qual ´e a margem deste enlace? E qual ´e a nova margem se usarmos um c´odigo de Hamming
% (57,63)? Dica: use o bertool para a obten¸c˜ao da BER codificada.

Rb = 100e9;
d = 10;
fc = 300e9;
B = 30e9;

Gt_dB = 26;
Gt = 10^((Gt_dB)/10);
Gr_dB = 26;
Gr = 10^((Gr_dB)/10);
Pt_dBm = 9; 
Pt_dB = Pt_dBm-30;
Pt = 10^((Pt_dBm-30)/10);
fig_N0_dB = 10;
fig_N0 = 10^((fig_N0_dB)/10);
PSD_dBm = -174;
PSD_dB = PSD_dBm-30;
PSD = 10^((PSD_dBm-30)/10);

BER = 1e-5;
snr_16qam_dB = 13.4;
snr_16qam = 10^(snr_16qam_dB/10);

c = 299792458;
lambda = c/fc;

PL = (16*pi^2*d^2)/(lambda^2);
PL_dB = 10*log10(PL);
Pr_16qam_dB = Pt_dB + Gt_dB + Gr_dB - PL_dB - fig_N0_dB;
Pr_16qam = Pt*Gt*Gr/(PL*fig_N0);

snr_proj_dB = Pr_16qam_dB - PSD_dB - 10*log10(Rb);
snr_proj = Pr_16qam/(PSD*Rb);

margem = snr_proj_dB - snr_16qam_dB

%RC = K/N = 57/63
snr_16qam_cod_dB = 11.7;
snr_16qam_cod = 10^(snr_16qam_cod_dB/10);

margem_cod = snr_proj_dB - snr_16qam_cod_dB
