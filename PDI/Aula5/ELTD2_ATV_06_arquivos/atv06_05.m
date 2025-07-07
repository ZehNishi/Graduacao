clear; clc; close all;

img = imread('cameraman.tif');
img = im2double(img);

% Máscaras de Kirsch (K0 a K7)
K0 = [-3 -3 5; -3 0 5; -3 -3 5];
K1 = [-3 5 5; -3 0 5; -3 -3 -3];
K2 = [5 5 5; -3 0 -3; -3 -3 -3];
K3 = [5 5 -3; 5 0 -3; -3 -3 -3];
K4 = [5 -3 -3; 5 0 -3; 5 -3 -3];
K5 = [-3 -3 -3; 5 0 -3; 5 5 -3];
K6 = [-3 -3 -3; -3 0 -3; 5 5 5];
K7 = [-3 -3 -3; -3 0 5; -3 5 5];
kirsch_masks = {K0, K1, K2, K3, K4, K5, K6, K7};

[l, c] = size(img);
kirsch_all = zeros(l, c, length(kirsch_masks));

for i = 1:length(kirsch_masks)
    kirsch_all(:, :, i) = imfilter(img, kirsch_masks{i}, 'replicate', 'conv');
end

kirsch = max(kirsch_all, [], 3);


figure;
subplot(1, 2, 1), imshow(img), title('Imagem Original');
subplot(1, 2, 2), imshow(mat2gray(kirsch)), title('Detecção de Bordas (Kirsch)');
