clc;
clear;

% 3. Agora, iremos considerar calculo de enlace de redes nao-terrestres. Os seguintes parametros
% sao inspirados nos apresentados.
% 
% Alem disso, considere que para este caso a perda de percurso para um usu´ario localizado a
% uma distˆancia d de um sat´elite e usando uma frequˆencia fc para transmiss˜ao ´e de
% P L(dB) = 32, 45 + 20 log10 fc(GHz) + 20 log10 d(m).Calcule a perda de percurso e a m´ınima 
% potˆencia de transmiss˜ao necess´aria para a obten¸c˜ao de uma BER n˜ao codificada m´ınima de 
% 10−5 em constela¸c˜oes QPSK e 64QAM, levando em conta sat´elites operando em uma ´orbita 
% geoestacion´aria situados a 35786 km de distˆancia da antena receptora na Terra. Assuma que 
% a taxa de sımbolos (e a correspondente taxa de dados) e a maxima possıvel com a largura de banda disponıvel.

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

PL_dB = 32.45+20*log10(fc/1e9)+20*log10(d);  %calculo em dB
PL = 10^(PL_dB/10);

% QPSK
M = 4;
Rs = B;
Rb_qpsk = log2(M)*Rs;
P_N0_qpsk_dB = -174 + 10*log10(Rb_qpsk); %ruido termico N0 = kT(PSD)+ BW
snr_qpsk_dB = 9.5878; 
Pr_qpsk_dB = P_N0_qpsk_dB + snr_qpsk_dB;
Pt_qpsk_dB = Pr_qpsk_dB - Gt_dB - Gr_dB + PL_dB + fig_N0_dB

% 64QAM
M = 64;
Rs = B;
Rb_64qam = log2(M)*Rs;
P_N0_64qam_dB = -174 + 10*log10(Rb_64qam); %ruido termico N0 = kT(PSD)+ BW
snr_64qam_dB = 17.8;
snr_64qam = 10^(snr_64qam_dB/10);
Pr_64qam_dB = P_N0_64qam_dB + snr_64qam_dB;
Pt_64qam_dB = Pr_64qam_dB - Gt_dB - Gr_dB + PL_dB + fig_N0_dB

% A perda de percurso é de PL = 213.0667dB e a mınima potencia de
% transmissao é de Pt = 27.6751 dBW para QPSK e Pt = 35.8873dBW para 64QAM

% Agora, o que acontece com a potˆencia de transmiss˜ao se considerarmos que o sistema est´a
% utilizando um c´odigo poderoso de corre¸c˜ao de erros capaz de operar o sistema na capacidade
% maxima de Shannon?

%QPSK
M = 4;
Rs = B;
Rb_qpsk = log2(M)*Rs;
C = Rb_qpsk;
snr_qpsk_dB = (B/C)*(2^(C/B)-1);
Pr_qpsk_dB = P_N0_qpsk_dB + snr_qpsk_dB;
Pt_qpsk_dB = Pr_qpsk_dB - Gt_dB - Gr_dB + PL_dB + fig_N0_dB

% 64QAM
M = 64;
Rs = B;
Rb_64qam = log2(M)*Rs;
C = Rb_64qam;
snr_64qam_dB = (B/C)*(2^(C/B)-1);
Pr_64qam_dB = P_N0_64qam_dB + snr_64qam_dB;
Pt_64qam_dB = Pr_64qam_dB - Gt_dB - Gr_dB + PL_dB + fig_N0_dB


% A mınima potencia de transmissao considerando a capacidade de Shannon 
% é de Pt = 19.5873 dBW para QPSK e Pt = 28.5873 dBW para 64QAM.