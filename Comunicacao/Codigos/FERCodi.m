% Parâmetros
n = 15;       % Número total de elementos
t = 1;        % Índice inicial da soma (j = t+1)
BER_prime = 3.5979e-2; % Valor de BER'

% Inicializar a soma
FER_prime = 0;

% Realizar a soma
for j = (t+1):n
    % Coeficiente binomial: n choose j
    binomial_coeff = nchoosek(n, j);
    
    % Termo da soma
    term = binomial_coeff * (BER_prime^j) * ((1 - BER_prime)^(n-j));
    
    % Somar o termo
    FER_prime = FER_prime + term;
end

% Resultado
disp(['FER'' = ', num2str(FER_prime)]);
