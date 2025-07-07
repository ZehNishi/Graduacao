clc, clear, close all

img1 = imread('carro1mm_nperiodic.png');
img2 = imread('chicomm_nperiodic.png');


F1 = fftshift(fft2(img1));
F2 = fftshift(fft2(img2));

magnitudeF1 = log(1 + abs(F1));
magnitudeF2 = log(1 + abs(F2));

figure
subplot(1, 2, 1)
imshow(magnitudeF1, [])
title('Carro')

subplot(1, 2, 2)
imshow(magnitudeF2, [])
title('Chico')

% Identificar os três maiores picos no espectro de F1
[magnitudeF1_sorted, idx1] = sort(abs(F1(:)), 'descend');
[peak1_row, peak1_col] = ind2sub(size(F1), idx1(1:3));
picos_F1 = [peak1_row, peak1_col];

% Identificar os três maiores picos no espectro de F2
[magnitudeF2_sorted, idx2] = sort(abs(F2(:)), 'descend');
[peak2_row, peak2_col] = ind2sub(size(F2), idx2(1:3));
picos_F2 = [peak2_row, peak2_col];

% Obter o tamanho das imagens
[rows1, cols1] = size(F1);
[rows2, cols2] = size(F2);

% Coordenada central do espectro
center1 = [floor(rows1/2)+1, floor(cols1/2)+1];
center2 = [floor(rows2/2)+1, floor(cols2/2)+1];

% Remover a coordenada central dos picos
picos_F1_no_center = picos_F1(all(picos_F1 ~= center1, 2), :);
picos_F2_no_center = picos_F2(all(picos_F2 ~= center2, 2), :);


% Definindo o valor de sigma (tamanho da região ao redor do pico)
sigma = 10;  % Esse valor pode ser ajustado conforme necessário

% Inicializar as máscaras
mask_F1 = ones(rows1, cols1);  % Máscara para a imagem F1
mask_F2 = ones(rows2, cols2);  % Máscara para a imagem F2

% Gerar máscaras para cada pico de F1
for i = 1:size(picos_F1_no_center, 1)
    % Coordenada do pico
    peak_coord = picos_F1_no_center(i, :);
    
    % Criar uma matriz de distâncias em relação ao pico
    [X, Y] = meshgrid(1:cols1, 1:rows1);
    dist = sqrt((X - peak_coord(2)).^2 + (Y - peak_coord(1)).^2);
    
    % Criar a gaussiana
    gauss_mask = exp(-dist.^2 / (2 * sigma^2));
    
    % A máscara será 1 fora da região do pico e a gaussiana será aplicada na área próxima
    mask_F1 = mask_F1 .* (1 - gauss_mask);  % Subtrair a gaussiana da máscara
end

% Gerar máscaras para cada pico de F2
for i = 1:size(picos_F2_no_center, 1)
    % Coordenada do pico
    peak_coord = picos_F2_no_center(i, :);
    
    % Criar uma matriz de distâncias em relação ao pico
    [X, Y] = meshgrid(1:cols2, 1:rows2);
    dist = sqrt((X - peak_coord(2)).^2 + (Y - peak_coord(1)).^2);
    
    % Criar a gaussiana
    gauss_mask = exp(-dist.^2 / (2 * sigma^2));
    
    % A máscara será 1 fora da região do pico e a gaussiana será aplicada na área próxima
    mask_F2 = mask_F2 .* (1 - gauss_mask);  % Subtrair a gaussiana da máscara
end

% Inicializar as imagens modificadas
F1_modified = F1;
F2_modified = F2;

% Multiplicação ponto a ponto com as máscaras para F1
F1_modified = F1_modified .* mask_F1/2;

% Multiplicação ponto a ponto com as máscaras para F2
F2_modified = F2_modified .* mask_F2/2;

% Plotar os espectros modificados
figure
subplot(1, 2, 1)
imshow(log(1 + abs(F1_modified)), [])
title('Espectro Carro (Picos Removidos com Máscara)')

subplot(1, 2, 2)
imshow(log(1 + abs(F2_modified)), [])
title('Espectro Chico (Picos Removidos com Máscara)')


% Transformada inversa de Fourier para voltar ao domínio espacial
F1_image = ifft2(F1_modified);
F2_image = ifft2(F2_modified);

% Se quiser visualizar as imagens no domínio espacial, podemos tomar o valor absoluto
F1_image_abs = abs(F1_image);
F2_image_abs = abs(F2_image);

% Plotar as imagens originais e as modificadas lado a lado
figure
subplot(2, 2, 1)
imshow(img1, [])
title('Imagem Original Carro')

subplot(2, 2, 2)
imshow(img2, [])
title('Imagem Original Chico')

subplot(2, 2, 3)
imshow(F1_image_abs, [])
title('Imagem Carro (Picos Removidos com Máscara)')

subplot(2, 2, 4)
imshow(F2_image_abs, [])
title('Imagem Chico (Picos Removidos com Máscara)')
