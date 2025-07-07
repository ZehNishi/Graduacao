clc, clear, close all

img = imread('cameraman.tif');

img = double(img);


[rows, cols] = size(img);
cx = cols / 2; 
cy = rows / 2; 

dft = fftshift(fft2(img));

sigma_values = [10, 20, 30];

figure;

for i = 1:length(sigma_values)
    sigma = sigma_values(i);
    
    [X, Y] = meshgrid(1:cols, 1:rows);
    gauss_low = exp(-((X - cx).^2 + (Y - cy).^2) / (2 * sigma^2));
    
    gauss_high = 1 - gauss_low;
    
    filtered_low = dft .* gauss_low;
    filtered_high = dft .* gauss_high;
    
    % img_low = real(ifft2(ifftshift(filtered_low)));
    % img_high = real(ifft2(ifftshift(filtered_high)));

    img_low = ifft2(filtered_low);
    img_high = ifft2(filtered_high);
    
    subplot(length(sigma_values), 3, (i-1)*3 + 1);
    imshow(mat2gray(log(1 + abs(gauss_low))));
    title(sprintf('Filtro Passa-Baixas (\\sigma=%d)', sigma));
    
    subplot(length(sigma_values), 3, (i-1)*3 + 2);
    imshow((img_low));
    title('Imagem Passa-Baixas');
    
    subplot(length(sigma_values), 3, (i-1)*3 + 3);
    imshow((img_high));
    title('Imagem Passa-Altas');
end