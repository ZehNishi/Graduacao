clc;
clear;

% 3. Agora, iremos considerar c´alculo de enlace de redes n˜ao-terrestres. Os seguintes parˆametros
% s˜ao inspirados nos apresentados em [2]:
% 
% Al´em disso, considere que para este caso a perda de percurso para um usu´ario localizado a
% uma distˆancia d de um sat´elite e usando uma frequˆencia fc para transmiss˜ao ´e de
% P L(dB) = 32, 45 + 20 log10 fc(GHz) + 20 log10 d(m). (1)
% Calcule a perda de percurso e a m´ınima potˆencia de transmiss˜ao necess´aria para a obten¸c˜ao
% de uma BER n˜ao codificada m´ınima de 10−5
% em constela¸c˜oes QPSK e 64QAM, levando em
% conta sat´elites operando em uma ´orbita geoestacion´aria situados a 35786 km de distˆancia da
% antena receptora na Terra. Assuma que a taxa de s´ımbolos (e a correspondente taxa de dados)
% ´e a m´axima poss´ıvel com a largura de banda dispon´ıvel.

Gt_dB = 38.5;
Gt = 10^((Gt_dB)/10);
Gr_dB = 39.7;
Gr = 10^((Gr_dB)/10);
fig_N0_dB = 1.2;
fig_N0 = 10^((fig_N0_dB)/10);
PSD_dBm = -174;
PSD_dB = PSD_dBm-30;
PSD = 10^((PSD_dBm-30)/10);
fc = 30e9;
B = 400e6;

ber = 1e-5;
d = 35786e3;
PL_dB = 32.45+20*log10(fc/1e9)+20*log10(d)  %calculo em dB
PL = 10^(PL_dB/10);

P_N0_dB = PSD_dBm-30 + 10*log10(B); %ruido termico N0 = kT(PSD)+ BW + fig_N0
P_N0 = PSD*B;

% QPSK
snr_qpsk_dB = 9.5; 
snr_qpsk = 10^(snr_qpsk_dB/10);
Pr_qpsk = P_N0*snr_qpsk*fig_N0;
Pr_qpsk_dB = P_N0_dB + snr_qpsk_dB + fig_N0_dB;

Pt_qpsk_dB = Pr_qpsk_dB - Gt_dB - Gr_dB + PL_dB %+ fig_N0_dB;
Pt_qpsk = Pr_qpsk*PL/(Gt*Gr);

% 64QAM
snr_64qam_dB = 17.8;
snr_64qam = 10^(snr_64qam_dB/10);
Pr_64qam = P_N0*snr_64qam*fig_N0;
Pr_64qam_dB = P_N0_dB + snr_64qam_dB + fig_N0_dB;

Pt_64qam_dB = Pr_64qam_dB - Gt_dB - Gr_dB + PL_dB %+ fig_N0_dB;
Pt_64qam = Pr_64qam*PL/(Gt*Gr);


% Agora, o que acontece com a potˆencia de transmiss˜ao se considerarmos que o sistema est´a
% utilizando um c´odigo poderoso de corre¸c˜ao de erros capaz de operar o sistema na capacidade
% maxima de Shannon?




