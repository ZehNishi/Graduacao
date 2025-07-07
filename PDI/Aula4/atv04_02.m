img =  imread('b5s.40.bmp');

g1 = imgaussfilt(img,0.5);

g2 = imgaussfilt(img,1.5);

figure;

subplot(1, 3, 1);
imshow(img);
title('Imagem Original');

subplot(1, 3, 2);
imshow(g1);
title('Filtro Gaussiano \sigma = 0.5');

subplot(1, 3, 3);
imshow(g2);
title('Filtro Gaussiano \sigma = 1.5');