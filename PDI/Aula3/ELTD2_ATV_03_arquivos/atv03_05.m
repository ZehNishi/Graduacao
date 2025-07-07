%Imagem
img = imread('gDSC04422m16.png');
nr = size(img,1);%Número de linhas
nc = size(img,2);%Número de colunas
N = nr*nc;%Número de pixels

hist = imhist(img);
hist_norm = hist/N;

cdf = cumsum(hist_norm);

cdf_arre = uint8(255*cdf);
img_eq = intlut(img, cdf_arre);

img_histeq = histeq(img,256);

figure;

subplot(3, 2, 1);
imshow(img);
title('Imagem Original');

subplot(3, 2, 2);
bar(0:255, hist);
title('Histograma Original');


subplot(3, 2, 3);
imshow(img_eq);
title('Imagem Equalizada (Manual)');

subplot(3, 2, 4);
imhist(img_eq);
title('Histograma Equalizado (Manual)');

subplot(3, 2, 5);
imshow(img_histeq);
title('Imagem Equalizada (Histeq)');

subplot(3, 2, 6);
imhist(img_histeq);
title('Histograma Equalizado (Histeq)');