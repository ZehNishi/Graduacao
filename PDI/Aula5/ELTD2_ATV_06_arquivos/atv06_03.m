clear; clc; close all;

img = imread('cameraman.tif'); 
img = im2double(img);

% Detecção de bordas usando Sobel (derivada de primeira ordem)
sobelEdges = edge(img, 'sobel');

% Detecção de bordas usando Laplaciano (derivada de segunda ordem)
h = fspecial('laplacian', 0); 
t = 0.5;
laplacianEdges = edge(img, 'zerocross', t, h);


figure;
subplot(1, 3, 1), imshow(img), title('Imagem Original');
subplot(1, 3, 2), imshow(sobelEdges), title('Bordas (Sobel)');
subplot(1, 3, 3), imshow(laplacianEdges), title('Bordas (Laplaciano)');

% R: Mesmo ajustando t (passagem por zero) para  um valor que a imagem de saida se aproxima da 
% imagem do sobel muitos detalhes capturados pelo sobel são deixados no laplaciano, e o ruido
% continua sendo capturado no laplaciano.