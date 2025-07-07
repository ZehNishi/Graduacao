clc, clear, close all

img1 = imread('psl1_gray.png');
img2 = imread('psl2_gray.png');
img3 = imread('psl3_gray.png');

se = strel('square', 4); %Elemento estruturante

level1 = graythresh(img1);
seg1 = imbinarize(img1, level1);
seg1 = ~seg1;

seg1 = imclose(seg1,se);%Fechar para tampar os buracos
seg1 = imopen(seg1,se);%Abrir para tirar o ruido


level2 = graythresh(img2);
seg2 = imbinarize(img2, level2);
seg2 = ~seg2;

seg2 = imclose(seg2,se);
seg2 = imopen(seg2,se);


level3 = graythresh(img3);
seg3 = imbinarize(img3, level3);
seg3 = ~seg3;

seg3 = imclose(seg3,se);
seg3 = imopen(seg3,se);





figure;

% Imagem 1
subplot(3, 2, 1);
imshow(img1);
title('Original - Imagem 1');

subplot(3, 2, 2);
imshow(seg1);
title('Segmentada - Imagem 1');

% Imagem 2
subplot(3, 2, 3);
imshow(img2);
title('Original - Imagem 2');

subplot(3, 2, 4);
imshow(seg2);
title('Segmentada - Imagem 2');

% Imagem 3
subplot(3, 2, 5);
imshow(img3);
title('Original - Imagem 3');

subplot(3, 2, 6);
imshow(seg3);
title('Segmentada - Imagem 3');
