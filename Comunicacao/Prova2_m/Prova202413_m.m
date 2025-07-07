clear;
clc;

k = 11;
n = 22;
t = 2;

M = 32;

snr = 10;

% Não codificado:
Pb = 13/(4*log2(M))*qfunc(sqrt(log2(M)*snr/10));
Pq = 1 - (1 - Pb)^k

% Codificado:

Pb_cod = 13/(4*log2(M))*qfunc(sqrt(log2(M)*snr/10));

FER_prime = 0;

% Realizar a soma
for j = (t+1):n
    % Coeficiente binomial: n choose j
    binomial_coeff = nchoosek(n, j);
    
    % Termo da soma
    term = binomial_coeff * (Pb_cod^j) * ((1 - Pb_cod)^(n-j));
    
    % Somar o termo
    FER_prime = FER_prime + term;
end

% Resultado
disp(['FER'' = ', num2str(FER_prime)]);