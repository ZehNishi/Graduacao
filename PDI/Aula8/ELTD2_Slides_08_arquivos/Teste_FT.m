% Teste_FTeIFT.m  | Teste da função [FT_Estudo] com sinal senoidal
% Teste_FT.m
% function [R, I] = FT_Estudo(f_r, f_i);
% 
clc, clear, close all
f=50;       % Hz
A=1;       % volts
inicio=0;  % inicio do intervalo de amostragem em segundos
fim=2;     % fim intervalo de amostragem em segundos
n_samples=512; % numero de amostras no tempo
delta_t=(fim-inicio)/n_samples; % intervalo de amostragem em segundos
t = inicio : delta_t : fim-delta_t; % escala de tempo em segundos

fs=1/delta_t; % freq de amostragem em Hz
delta_f=fs/n_samples; % resolução do espectro
esc_freq=-fs/2 : delta_f : (fs/2-delta_f); % escala de freq

% Teste com uma função senoidal 
fdet=2 + A.*sin(2*pi*f*t) + A/1.5.*cos(2*pi*2*f*t); % funcao f(t)

% %Teste com um degral 
% fdet(1:n_samples)=0;
% fdet(t<0.5)=1;
% n=0:n_samples-1;
% fdet=fdet.*(-1).^n;

figure, plot(t, fdet); grid on;
xlabel('tempo [s]')
ylim([-1 3]);


R(1:size(fdet,2))=0; % vetor para a parte real do espectro
I(1:size(fdet,2))=0; % vetor para a parte imaginaria do espectro
f_r(1:size(fdet,2))=0; % vetor para a parte real do sinal
f_i(1:size(fdet,2))=0; % vetor para a parte imaginaria do sinal
f_r=fdet; % parte real é igual ao sinal

[R, I] = FT_Estudo(f_r, f_i);

R=fftshift(R);
I=fftshift(I);

modulo=sqrt(R.^2+I.^2)/n_samples;
figure, plot(esc_freq, modulo); grid on
xlabel('frequencia [Hz]')