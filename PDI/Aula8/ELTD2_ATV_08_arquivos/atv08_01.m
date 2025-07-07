clc, clear, close all

img = imread('carro1mm_nperiodic.png');

img = double(img);


dftr = fft(img, [], 1);

dft_manual = fft(dftr, [], 2);


dft_fft2 = fft2(img);

figure;


subplot(1, 3, 1);
imshow(log(1 + abs(dft_manual)), []);
title('DFT 2D (Manual via separabilidade)');


subplot(1, 3, 2);
imshow(log(1 + abs(dft_fft2)), []);
title('DFT 2D (fft2)');


subplot(1, 3, 3);
imshow(log(1 + abs(dft_manual - dft_fft2)), []);
title('Diferença (Manual vs fft2)');