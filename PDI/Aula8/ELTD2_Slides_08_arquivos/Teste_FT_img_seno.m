% Teste da função [FT_Estudo] COM IMAGEM FORMADA PELA FUNÇÃO SENOIDAL
% Teste_FT_img_seno.m
% function [R, I] = FT_Estudo(f_r, f_i);

clc, clear, close all
f=10;      % Hz
A=1;       % volts
inicio=0;  % inicio do intervalo de amostragem em segundos
fim=2;     % fim intervalo de amostragem em segundos
n_samples=512; % numero de amostras no tempo
delta_t=(fim-inicio)/n_samples; % intervalo de amostragem em segundos
t = inicio : delta_t : fim-delta_t; % escala de tempo em segundos

fs=1/delta_t; % freq de amostragem em Hz
delta_f=fs/n_samples; % resolução do espectro
esc_freq=-fs/2 : delta_f : (fs/2-delta_f); % escala de freq

fdet=2 + A.*sin(2*pi*f*t);% + A/1.5.*cos(2*pi*2*f*t); % funcao f(t)

img=zeros(512, 512);
img(1:512, :) = repmat(fdet, 512, 1);
figure, imshow(img, []);

% Traçar o perfil da imagem
% usuário desenha linha
h = imline;
posicao = wait(h);
% Obtenha as coordenadas da linha
x1 = posicao(1,1);
y1 = posicao(1,2);
x2 = posicao(2,1);
y2 = posicao(2,2);

% Extraia o perfil de intensidade ao longo da linha
perfil = improfile(img, [x1 x2], [y1 y2]);

% Exibir o perfil de intensidade
figure;
plot(perfil);
title('Perfil de Intensidade ao Longo da Linha');
xlabel('Distância ao Longo da Linha');
ylabel('Intensidade');
% FIM: Traçar o perfil da imagem


% FT das linhas
[row, col] = size(img);
f_r=img;
f_i=zeros(512, 512);
f_R(1:col) = 0;
f_I(1:col) = 0;
n=0:col-1;
for idx = 1:1:row 
    f_R(:) = img(idx, :); %parte real é igual a img
    f_I(:) = 0; % parte imaginária é igual a zero
    [R, I] = FT_Estudo(f_R, f_I);
    F_R(idx, :) = R(:); %F_R parte real do spectro
    F_I(idx, :) = I(:); %F_I parte imaginária do spectro
end
modulo=sqrt(F_R.^2+F_I.^2);
figure, imshow(log(0.01+(modulo)), []);

%FT das colunas
%transformada direta das colunas
clear f_R f_I n;
f_R(1:row) = 0;
f_I(1:row) = 0;
n=0:row-1;
for idx = 1:1:col  
    f_R(:) = F_R( : , idx);
    f_I(:) = F_I( : , idx);
    [R, I] = FT_Estudo (f_R, f_I);
    F_R( : , idx) = R(:);
    F_I( : , idx) = I(:);
end

modulo=sqrt(F_R.^2+F_I.^2);
modulo=fftshift(modulo);
figure, imshow(log(0.01+(modulo)), []); title('log Modulo do spectro')


