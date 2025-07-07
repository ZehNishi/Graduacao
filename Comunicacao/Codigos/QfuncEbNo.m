clc;
clear all;

m = 16;
No = 1.1943e-12;
Eb = 7.9612e-19;
Eb_No = 8.3096;


% Pb = 2*(m-1)/(m*log2(m))*qfunc(sqrt(6*log2(m)/(m^2-1)*Eb/No)) %M-PAM
% 
% Nb = 500;
% Pq = 1-(1-Pb)^Nb;
% 


k = log2(m);                        %M-QAM

% term = sqrt((3 * k * Eb) / ((m - 1) * No));
term = sqrt((3 * k * Eb_No) / ((m - 1)));

factor = (4 / k) * (1 - 1 / sqrt(m));

Pb = factor * qfunc(term)

