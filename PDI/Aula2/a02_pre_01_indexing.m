% a02_pre_01_indexing [script]

% Criar, mostrar e salvar uma imagem no formato png, contendo apenas o pássaro
% da imagem 42049.png. Também mostrar a 42049.png com um quadrado
% preto sobre a área que foi recortada. Dica: a primeira coisa a fazer é obter
% as coordenadas do canto superior direito e do cando inferior esquerdo do
% pássaro na imagem 42049.png.

clc, clear, close all

g = imread('42049.jpg');
figure
imshow(g)

%canto superior esquerdo: linha 83, coluna 160
%canto inferior direito: linha 268, coluna 278
crop = g(83:268,168:278);
figure
imshow(crop)

imwrite(crop, 'submatriz.png');

g2 = g;
g2(83:268,168:278) = 0;
figure
imshow(g2)