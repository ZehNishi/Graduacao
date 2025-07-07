clc;
clear;

% A eterna busca por maior largura de banda leva os pesquisadores a investigar a faixa de
% frequˆencia dos terahertz para comunica¸c˜ao sem fio. Os seguintes parˆametros de um enlace
% de 100 Gbps a 10 m de distˆancia operando na frequˆencia de 300 GHz s˜ao inspirados nos
% apresentados em [3]:
                % Parˆametro Valor
                % GT 26 dB
                % GR 26 dB
                % PT x 9 dBm
                % Figura de ru´ıdo 10 dB
                % PSD do ru´ıdo -174 dBm/Hz
                % Frequˆencia de portadora 300 GHz
                % Largura de banda 30 GHz
                % Modula¸c˜ao 16-QAM
                % BER m´axima 10−5
% Qual ´e a margem deste enlace? E qual ´e a nova margem se usarmos um c´odigo de Hamming
% (57,63)? Dica: use o bertool para a obten¸c˜ao da BER codificada.

Rb = 100e9;
Rb_db = 10*log10(Rb);
d = 10;
fc = 300e9;
c = 299792458;
lambda = c/fc;
Gt_db = 26;
Gr_db = 26;
Pt_db = 9 - 30;
FigRuido_db = 10;
No_db = -204;
B = 30e9;
M = 16;
Pb = 1e-5;
P_No_db = -204 + 10*log10(B) + FigRuido_db;
Pl = 16*pi^2*d^2/(lambda^2);
Pl_db = 10*log10(Pl);
Pr_db = Pt_db - Pl_db + Gr_db + Gt_db;
Eb_No_db = Pr_db - P_No_db;
Eb_No_db_min = 13.4345;
M_db = Eb_No_db - Eb_No_db_min

Eb_No_db_Hamming = 11.67;
M_db_cod = Eb_No_db - Eb_No_db_Hamming

% Resposta: Margem sem código de 4.8041dB;
%           Margem com código de 6.5686dB.