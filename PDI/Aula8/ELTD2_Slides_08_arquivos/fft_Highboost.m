% fft_Highboost [script]
clc, clear, close all
 
% img = imread('Fig0459(a)(orig_chest_xray).tif');
% img = rgb2gray(imread('moon-8855057_1920.jpg'));
img = rgb2gray(imread('rhino-8795538_1920.jpg'));

%img = imread('flowervaseg.png');

img_d = double(img);
figure, imshow(img), title('Imagem de entrada')
 
% DFT 2D
F = fft2(img_d);
% Centralizada (reposicionamento ou shifiting)
F_s = fftshift(F);
figure, imshow(mat2gray(log(1+abs(F_s))))
title('DFT da imagem')
 
% Filtro Highboost
[nr nc] = size(img_d);
H_pb = fspecial('gaussian', [nr nc], 25);
H_pa = 1 - mat2gray(H_pb);
figure, imshow(H_pa)
title('Filtro PA Gaussiano')
figure, surf(H_pa)
title('Filtro PA Gaussiano')
A = 2; % A > 1
H_hb = (A - 1) + H_pa;

% Multiplicação ponto-a-ponto (aplicação do filtro)
F_hb = F_s .* H_hb;

% DFT 2D inversa
img_hb = ifft2(F_hb);

% Magnitude e visualização
img_hb = uint8(abs(img_hb));
figure, imshow(img_hb)
title('Saída Highboost')