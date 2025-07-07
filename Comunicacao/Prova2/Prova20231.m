clear all
clc

% Considere um sistema de comunicações que transmite quadros com comprimento
% de 12 bits e opera a uma taxa líquida de dados de 10 MBps. A FER desejada neste sistema
% é de 10−2. A distância entre o transmissor e o receptor é de 300 m em um ambiente urbano,
% com uma frequência de operação de 3,5 GHz. A densidade espectral de potência do ruído é
% de -204 dBW/Hz. Considere também que o ganho tanto das antenas de transmissão quanto
% das de recepção é de 3 dB, e utilize uma margem de 1,5 dB. O filtro de formatação utilizado
% tem o fator de excesso de faixa de 0,3.
uncodedFrameSize = 11;
Rb = 1e6;
FER = 5e-2;
d = 250;
fc = 2.45e9;
N0_dB = -204;
Gt_dB = 3;
Gr_dB = 3;
Ma_dB = 0.5;
alpha = 0.25;

N0 = 10^(N0_dB/10);
Gt = 10^(Gt_dB/10);
Gr = 10^(Gr_dB/10);
n = 4;
d0 = 1;
c = 3*10^8;
lambda = c/fc;

% (b) (3,0 pontos) Utilizando uma constelação 16 - QAM, qual a potência de transmissão
% mínima para atingir a FER desejada?
BER_max = 1 - power(1 - FER,1/uncodedFrameSize);

M = 16;
EbN0_16QAM = qfuncinv(BER_max*log2(M)/(4*(1-1/sqrt(M))))^2*(M-1)/(3*log2(M));
EbN0_16QAM_dB = 10*log10(EbN0_16QAM);

Pr_16QAM = EbN0_16QAM*Rb*N0;
Pr_16QAM_dBW = 10*log10(Pr_16QAM);

PL_dB = 10*log10(16*pi^2*d0^2/lambda^2) + 10*n*log10(d/d0);

Pt_16QAM_dBW = Pr_16QAM_dBW - Gt_dB - Gr_dB + PL_dB - Ma_dB;

% (c) (1,5 pontos) E se utilizarmos um código corretor de erros que gera palavras código de 24
% bits, com capacidade de corrigir 3 erros por palavra código?

%Pb_16QAM_cod = 3/4*qfunc(sqrt(4/5*EbN0_16QAM*k/n));
EbN0_BPSK_cod_dB = 4.25;
EbN0_16QAM_cod_dB = 7.5;

% (a) (0,5 pontos) Qual a largura de banda mínima ocupada por esta transmissão? Justifique.
% Aqui depende da modulação!
B_BPSK = Rb*(1+alpha);
B_16QAM = (Rb/4)*(1+alpha);
