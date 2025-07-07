clc;
clear all;

m = 16; %M-PAM
Pb = 1e-3; % Probabilidade de erro de bit
No = 2.0992e-12;


% Eb = (qfuncinv((Pb*m*log2(m))/(2*(m-1))))^2*(m^2-1)*No/(6*log2(m)) %M-PAMs



k = log2(m); % Número de bits por símbolo       %M-QAM
factor = k * Pb / (4 * (1 - 1 / sqrt(m)));
x = qfuncinv(factor);
% Eb = (x^2 * (m - 1) * No) / (3 * k)
EbNo = (x^2 * (m - 1) ) / (3 * k)
EbNo_dB = 10*log10(EbNo)


