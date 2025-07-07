clear;

% %\item Um dispositivo é configurado para uma taxa de transmissão
% de 1 Mbps. O transmissor deste sistema tem uma potência efetivamente
% irradiada de transmissão de 30 dBm, enquanto o receptor tem uma antena
% de ganho de 0 dB. Este dispositivo está configurado para operar na
% frequência de portadora de 2,4 GHz e com a modulação da questão 1, com
% quadros de 4 bits e uma BER mínima de 10^-5. A densidade espectral de potência do ruído é de
% -204 dBW/Hz.

Rb = 1e6;
EIRP_dB = 0;
EbN0_dB = 14.28;
Gr_dB = 0;
fc = 2.4e9;
N0_dB = -204;

%     Qual a distância máxima que podemos separar o transmissor do receptor
%     considerando espaço livre?
Rb_dB = 10*log10(Rb);
c = 3*10^8;
lambda = c/fc;

Pr_dBW = Rb_dB + EbN0_dB + N0_dB;
PL_dB = EIRP_dB + Gr_dB - Pr_dBW;
d_fs = sqrt(10^(PL_dB/10))*lambda/(4*pi);

disp(['Distância para espaço livre = ' num2str(d_fs)])

%     Repita o item anterior considerando agora o modelo log-distância com
%     $n = 3$.
d0 = 1;
n = 3;
d_ld = d0*(10^(PL_dB/10)*(lambda/(4*pi*d0))^2)^(1/n);

disp(['Distância para log-distância = ' num2str(d_ld)])

%     Vamos considerar que o dispositivo tem capacidade
%     computacional para a operação de um código corretor de erros operando
%     no limite de Shannon. Qual a distância máxima possível de operação,
%     considerando o modelo de espaço livre?
Rs = Rb/3;
B = Rs;
EbN0_new = (B/Rb) * (2^(Rb/B)-1);
EbN0_new_dB = 10*log10(EbN0_new);

Pr_new_dBW = Rb_dB + EbN0_new_dB + N0_dB;
PL_new_dB = EIRP_dB + Gr_dB - Pr_new_dBW;
d_fs_new = sqrt(10^(PL_new_dB/10))*lambda/(4*pi);

disp(['Distância para espaço livre e limite de Shannon  = ' num2str(d_fs_new)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Considere um código corretor de erros de taxa $\frac{k}{n}=\frac{12}{24}$
% e que corrige até dois erros por palavra código. Assuma que uma modulação
% BFSK com demodulação não coerente (sem necessidade de sincronização de
% fase) é utilizada, em que $P_b=\frac{1}{2}
% e^{-\frac{1}{2}\frac{E_b}{N_0}}$, e que $\frac{E_b}{N_0}=14$ dB no caso
% não codificado.
k = 12;
n = 24;
EbNoVec = [7,8,9,10,11,12,13,14];
berBFSK = [0.0408000000000000,0.0213240000000000,0.00942120000000000,0.00336900000000000,0.000923100000000000,0.000180890000000000,2.32440000000000e-05,1.75580000000000e-06];

ferUncoded = 1-((1-berBFSK).^k);

calcVec = 3:n;
ferVec = zeros(length(berBFSK),length(calcVec));

for i = 1:length(berBFSK)
    for ii = 1:length(calcVec)
        ferVec(i,ii) = nchoosek(n,calcVec(ii)) * (berBFSK(i)^(calcVec(ii))) * ((1-berBFSK(i))^(n-calcVec(ii)));
    end
end

ferCoded = sum(ferVec,2);

disp(['FER não codificada para 14 dB = ' num2str(ferUncoded(8))])
disp(['FER codificada para 11 dB = ' num2str(ferCoded(5))])

% A probabilidade de erro de mensagem no caso codificado é melhor ou pior
% do que no caso não codificado? Refaça considerando que
% $\frac{E_b}{N_0}=10$ dB no caso não codificado.

disp(['FER não codificada para 10 dB = ' num2str(ferUncoded(4))])
disp(['FER codificada para 7 dB = ' num2str(ferCoded(1))])