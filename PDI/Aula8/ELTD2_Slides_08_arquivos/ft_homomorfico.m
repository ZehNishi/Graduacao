% ft_homomorfico [script]
clc, clear, close all

img = imread('Tunel.jpg');
img = im2double(img);

% ln da imagem original
img_log = log(0.01 + img);

% DFT do ln da imagem original
F_log = fft2(img_log);
% Centralizada (reposicionamento ou shifiting)
F_log_s = fftshift(F_log);

[nr nc] = size(img);

% Filtro passa-altas Gaussiano
sigma=50;
[x, y] = meshgrid(-floor(nc/2):floor(nc/2-1), -floor(nr/2):floor(nr/2-1));
gaussian_lp = exp(-(x.^2 + y.^2) / (2*sigma^2));
H_pa = 1 - gaussian_lp;

figure, subplot(121);
surf(H_pa , EdgeColor = 'none');
title('H\_pa');

% gamaL < 1 e gamaH > 1
gamaL = 0.5; % controla as baixas frequencias (luminancia)
gamaH = 1.1; % controla as altas frequencias (refletancia)

H_homomorfico = ((gamaH-gamaL).*H_pa) + gamaL;

subplot(122), surf(H_homomorfico , EdgeColor = 'none');
title(['H\_homomorfico: gamaL=' num2str(gamaL) ', gamaH=' num2str(gamaH)]);

% Multiplicação ponto-a-ponto (aplicação do filtro)
F_hm = F_log_s .* H_homomorfico;

% DFT 2D inversa
img_hm = ifft2(fftshift(F_hm));

% Magnitude e exp da inversa
img_hm_e = abs(exp(img_hm)-0.01);

% Visualização
figure, subplot(121)
imshow(img), title('Original')
subplot(122)
imshow(img_hm_e)
title('Saída Homomórfico')