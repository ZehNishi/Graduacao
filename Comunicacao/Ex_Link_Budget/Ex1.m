clc;
clear;

% Considere um enlace de comunica¸c˜ao de banda passante com uma largura de banda
% de 1,5 MHz e com um Pr/N0 dispon´ıvel = 82 dB Hz. A taxa m´axima de erro de bit ´e 10−6.

B = 1.5e6;
% Pr_No_db = 82; %Disponivel
Pb = 1e-6;


% (a) Se a modula¸c˜ao for 16-PSK usando um filtro raiz de cosseno levantado com α = 0,5, qual
% ´e a taxa de bits m´axima alcan¸c´avel um enlace? Este ´e um canal limitado por potˆencia
% ou por largura de banda?

Eb_No_db = 18.414;
M = 16;
alpha = 0.5;
% B = Rs*(1+alpha)
Rs = B/(1+alpha);
Rb = Rs*log2(16);
disp(Rb);
Rb_db = 10*log10(Rb);
Pr_No_db = Eb_No_db + Rb_db;
disp(Pr_No_db);


% Resposta: Rb máximo de 8e6 gera uma SNR de 84.4346dBHz, ou seja o canal
% está limitado em potência!

% (b) Se a modula¸c˜ao for 16-QAM quadrada usando um filtro raiz de cosseno levantado com α
% = 0,5, qual ´e a taxa de bits m´axima alcan¸c´avel nesta enlace? Este ´e um canal limitado
% por potˆencia ou por largura de banda?


Eb_No_db = 14.4017;
M = 16;
alpha = 0.5;
% B = Rs*(1+alpha)
Rs = B/(1+alpha);
Rb = Rs*log2(16);
Rb_db = 10*log10(Rb);
Pr_No_db = Eb_No_db + Rb_db;
disp(Pr_No_db);

% Resposta: Rb máximo de 8e6Hz gera uma SNR de 80.4223dBHz, ou seja o canal
% está limitado em banda!