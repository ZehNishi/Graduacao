clc;
clear;

% Agora, iremos considerar c´alculo de enlace de redes n˜ao-terrestres. Os seguintes parˆametros
% s˜ao inspirados nos apresentados em [2]:
            % Parˆametro Valor
            % GT 38.5
            % GR 39.7 dB
            % Figura de ru´ıdo 1.2 dB
            % Frequˆencia de portadora 30 GHz
            % Largura de banda 400 MHz
            % PSD do ru´ıdo -174 dBm/Hz
% Al´em disso, considere que para este caso a perda de percurso para um usu´ario localizado a
% uma distˆancia d de um sat´elite e usando uma frequˆencia fc para transmiss˜ao ´e de
% P L(dB) = 32, 45 + 20 log10 fc(GHz) + 20 log10 d(m). (1)
% Calcule a perda de percurso e a m´ınima potˆencia de transmiss˜ao necess´aria para a obten¸c˜ao
% de uma BER n˜ao codificada m´ınima de 10−5
% em constela¸c˜oes QPSK e 64QAM, levando em
% conta sat´elites operando em uma ´orbita geoestacion´aria situados a 35786 km de distˆancia da
% antena receptora na Terra. Assuma que a taxa de s´ımbolos (e a correspondente taxa de dados)
% ´e a m´axima poss´ıvel com a largura de banda dispon´ıvel.
% Agora, o que acontece com a potˆencia de transmiss˜ao se considerarmos que o sistema est´a
% utilizando um c´odigo poderoso de corre¸c˜ao de erros capaz de operar o sistema na capacidade
% m´axima de Shannon?

Gt_db = 38.5;
Gr_db = 39.7;
FigRuido_db = 1.2;
fc = 30e9;
B = 400e6;
No_db = -204;
Pb = 1e-5;
d = 35786e3;
Pl_db = 32.45 + 20*log10(fc/1e9) + 20*log10(d);
No = 10^(No_db/10);

% QPSK:
Rs = B;
Rb = log2(4)*Rs;
Rb_db = 10*log10(Rb);
Eb_No_db = 9.5878;
Pruido = No_db + 10*log10(Rb);
Pr_db = Pruido + Eb_No_db - Gr_db;
Pt_db = Pr_db + Pl_db - Gt_db + FigRuido_db;
disp("Potencia QSPK:")
disp(Pt_db);

%Limite de Shannon
SNR = B/Rb*(2^(Rb/B)-1);
Pr_db = SNR + Pruido - Gr_db;
Pt_db = Pr_db + Pl_db - Gt_db;
disp("Potencia QSPK minímo:")
disp(Pt_db);

% 64-QAM:
Rs = B;
Rb = log2(64)*Rs;
Rb_db = 10*log10(Rb);
Eb_No_db = 17.7869;
Eb_No = 10^(Eb_No_db/10);
Eb_db = Eb_No_db + No_db;
Pruido = No_db + 10*log10(Rb);
Pr_db = Eb_No_db + Pruido - Gr_db;
Pt_db = Pr_db + Pl_db - Gt_db;
disp("Potencia 64QAM:")
disp(Pt_db);

%Limite de Shannon
SNR = B/Rb*(2^(Rb/B)-1);
Pr_db = SNR + Pruido - Gr_db;
Pt_db = Pr_db + Pl_db- Gt_db;
disp("Potencia 64QAM minímo:")
disp(Pt_db);


% Resposta: Perda de percuso de 213.0667 dB;
% Para QPSK: Potência transmitida de 27.6751dBW, com um código poderos:
% Potência transmitida de 19.5873dbW.
% Para 64QAM: Potência transmitida de 35.8742dBW, com um código poderos:
% Potência transmitida de 28.5873dbW
% A potência de transmissão cai bastante.