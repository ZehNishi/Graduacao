clear all
clc

% Considere um sistema de comunicações que transmite quadros com comprimento
% de 12 bits e opera a uma taxa líquida de dados de 10 MBps. A FER desejada neste sistema
% é de 10−2. A distância entre o transmissor e o receptor é de 500 m em um ambiente urbano,
% com uma frequência de operação de 3,5 GHz. A densidade espectral de potência do ruído é
% de -204 dBW/Hz. Considere também que o ganho tanto das antenas de transmissão quanto
% das de recepção é de 3 dB, e utilize uma margem de 1,5 dB. O filtro de formatação utilizado
% tem o fator de excesso de faixa de 0,3.
uncodedFrameSize = 12;
Rb = 80e6;
FER = 1e-2;
d = 500;
fc = 3.5e9;
N0_dB = -204;
PSD = 10^(N0_dB/10);
PSD_dB = 10*log10(PSD);
Gt_dB = 3;
Gr_dB = 3;
Ma_dB = 1.5;
alpha = 0.3;

N0 = 10^(N0_dB/10);
Gt = 10^(Gt_dB/10);
Gr = 10^(Gr_dB/10);
n = 4;
d0 = 1;
c = 3*10^8;
lambda = c/fc;

% (a) (0,5 pontos) Qual a largura de banda mínima ocupada por esta transmissão? Justifique.
% Aqui depende da modulação!
B_BPSK = Rb*(1+alpha);
B_256QAM = (Rb/8)*(1+alpha);

% (b) (3,0 pontos) Utilizando uma constelação 16 - QAM, qual a potência de transmissão
% mínima para atingir a FER desejada?
BER_max = 1 - power(1 - FER,1/uncodedFrameSize);

M = 16;
EbN0_16QAM = qfuncinv(BER_max*log2(M)/(4*(1-1/sqrt(M))))^2*(M-1)/(3*log2(M));
EbN0_16QAM_dB = 10*log10(EbN0_16QAM);

Rs = Rb/4;
B = Rs*(1+alpha);

Pr_16QAM = EbN0_16QAM*B*N0;
Pr_16QAM_dBW = 10*log10(Pr_16QAM);

PL_dB = 10*log10(16*pi^2*d0^2/lambda^2) + 10*n*log10(d/d0);
PL = 10^(PL_dB/10);

Pt_16QAM_dBW = Pr_16QAM_dBW - Gt_dB - Gr_dB + PL_dB - Ma_dB;
disp(Pt_16QAM_dBW);

% (c) (1,5 pontos) E se utilizarmos um código corretor de erros que gera palavras código de 24
% bits, com capacidade de corrigir 3 erros por palavra código?

n = 24;
k = 12;
Pb_16qam_cod = 3.5979e-2;
snr_cod = (5/4)*(n/k)*qfuncinv((4/3)*Pb_16qam_cod)^2;
snr_cod_dB = 10*log10(snr_cod);
Rb_ = Rb*(n/k);
Rs_ = Rb/4;
B_ = Rs_*(1+alpha);
% Pr_ = snr_cod*PSD*Rb_;
Pr_dB_ = snr_cod_dB + PSD_dB + 10*log10(B_);
% Prw= 10*log10(Pr_);

% Pt_ = (Pr_*PL)/(Gt*Gr*margem);
Pt_dB_ = Pr_dB_ - Gt_dB - Gr_dB + PL_dB - Ma_dB;
disp(Pt_dB_);



% (d) (1,0 pontos) Como poderíamos reduzir a largura de banda ocupada por esta transmissão?
% Exemplifique através de cálculos e justifique.
% 
% M = 256;
% EbN0_256QAM = qfuncinv(BER_max*log2(M)/(4*(1-1/sqrt(M))))^2*(M-1)/(3*log2(M));
% EbN0_256QAM_dB = 10*log10(EbN0_256QAM);
% 
% Pr_256QAM = EbN0_256QAM*Rb*N0;
% Pr_256QAM_dBW = 10*log10(Pr_256QAM);
% 
% PL_dB = 10*log10(16*pi^2*d0^2/lambda^2) + 10*n*log10(d/d0);
% 
% Pt_256QAM_dBW = Pr_256QAM_dBW - Gt_dB - Gr_dB + PL_dB - Ma_dB;


% (e) (1,0 pontos) Como poderíamos reduzir a potência desta transmissão?
% Exemplifique através de cálculos e justifique.