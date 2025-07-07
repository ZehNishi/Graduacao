clc, clear, close all

img_size = 256;
square_size = 50;

img1 = zeros(img_size); %Quadrado no centro
center = img_size / 2;
img1(center - square_size / 2:center + square_size / 2 - 1,center - square_size / 2:center + square_size / 2 - 1) = 1;

img2 = zeros(img_size); % Quadrado deslocado
img2(center - square_size / 2 + 30:center + square_size / 2 + 29, center - square_size / 2 + 45:center + square_size / 2 + 44) = 1;

img3 = imrotate(img1, 45, 'bilinear', 'crop'); % Rotaciona 45 graus


dft1 = fftshift(fft2(img1));
dft2 = fftshift(fft2(img2));
dft3 = fftshift(fft2(img3));

spec1 = log(1 + abs(dft1));
spec2 = log(1 + abs(dft2));
spec3 = log(1 + abs(dft3));



figure;

% Imagem 1 e seu espectro
subplot(3, 2, 1);
imshow(img1, []);
title('Quadrado Centralizado');

subplot(3, 2, 2);
imshow(spec1, []);
title('Espectro (Centralizado)');

% Imagem 2 e seu espectro
subplot(3, 2, 3);
imshow(img2, []);
title('Quadrado Deslocado');

subplot(3, 2, 4);
imshow(spec2, []);
title('Espectro (Deslocado)');

% Imagem 3 e seu espectro
subplot(3, 2, 5);
imshow(img3, []);
title('Quadrado Rotacionado');

subplot(3, 2, 6);
imshow(spec3, []);
title('Espectro (Rotacionado)');
