clc;
clear;

%Rc = k/n = 12/24
k = 12;
n = 24;
t = 2;

snr_dB = 14;
snr = 10^(snr_dB/10);
Pb = (1/2)*exp(-snr/2);
Pq = 1 -(1-Pb)^k

% A probabilidade de erro de mensagem no caso codificado ´e melhor ou pior
% do que no caso n˜ao codificado?

Pb_ = (1/2)*exp(-snr/2);
Pq_ = 0;
for j = (t+1) : n
    Pq_ = Pq_ + nchoosek(n, j)*(Pb_^j)*((1-Pb_)^(n-j));
end

% Refa¸ca considerando que EbN0= 10 dB no caso n˜ao codificado.

snr_dB = 10;
snr = 10^(snr_dB/10);
Pb = (1/2)*exp(-snr/2);
Pq2 = 1 -(1-Pb)^k