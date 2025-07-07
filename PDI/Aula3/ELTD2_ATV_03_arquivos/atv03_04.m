%Imagem
img = imread('gDSC04422m16.png');

eq_hist = histeq(img,256);

figure;

subplot(1, 2, 1);  
imshow(img);     
title('Imagem Original');


subplot(1, 2, 2);  
imshow(eq_hist);  
title('Imagem com Equalização de Histograma');