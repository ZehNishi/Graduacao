clear; clc; close all;

img = imread('cameraman.tif');
img = im2double(img);

threshold = 0.5; % Limiar fixo para a detecção de bordas
sigma_values = [0.1, 0.4, 0.6]; % Três valores diferentes de sigma

figure;
subplot(2, 2, 1), imshow(img), title('Imagem Original');

for i = 1:length(sigma_values)
    sigma = sigma_values(i);
    BW = edge(img, 'log', threshold, sigma);
    subplot(2, 2, i+1), imshow(BW);
    title(['LoG, \sigma = ', num2str(sigma)]);
end


% R: Mantendo o valor de threshold (passagem por zero) constante e variando
% apenas o sigma vemos que quanto maior o sigma menos detalhes são
% capturados da imagem, ou seja um sigma baixo é mais sensivel a ruido.