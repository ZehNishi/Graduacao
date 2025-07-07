clear all;
clc;

img_ref = imread("einstein.gif");
img = imread("meanshift.gif");

qs = ssim(img,img_ref)
qe = immse(img,img_ref)

% Imagem = blur
% Mse = 143.9085
% Ssim = 0.7022

% Imagem = contrast
% Mse = 144.2188
% Ssim = 0.9012

% Imagem = impulse
% Mse = 143.9390
% Ssim = 0.8395

% Imagem = jpg
% Mse = 141.9529
% Ssim = 0.6699

% Imagem = meanshift
% Mse = 143.9945
% Ssim = 0.9873

% 1. A ‘Demonstration’ foi reproduzida com sucesso?
%  (a) Não, o código não funcionou.
%  (b) Não, o MSE foi melhor que o SSIM.
%  (x) Sim. Embora os resultados possam não ser numericamente idênticos, são muitíssimos parecidos.
%  (d) Sim. O SSIM representa a imagem através de wavelets e captura com fidelidade perfeita
% a qualidade das imagens

% 2. Por que o índice SSIM é melhor que o MSE neste experimento?
%  (a) Ele não é melhor nem pior, é só uma maneira computacionalmente mais eficiente
%  de calcular o MSE.
%  (x) Porque o MSE apresenta valores praticamente iguais para qualidades notavelmente
%  diferentes das imagens, enquanto o SSIM captura essas diferenças, além de apresentar
%  valores compatíveis com a noção de qualidade que seria atribuída por uma pessoa (SVH).
%  (c) Porque o SSIM, conforme explicado anteriormente, utiliza wavelets para capturar com
%  fidelidade a qualidade das imagens objetivamente.
%  (d) Porque o SSIM exige menos cálculos que MSE, além de ser mais fácil de implementar
 % em Python.