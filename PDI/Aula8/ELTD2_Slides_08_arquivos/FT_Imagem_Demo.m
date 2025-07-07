% FT de Imagem sem usar a fft2 ou fft do matlab
% [R, I] = FT_Estudo (f_R, f_I); 

clc, clear, close all;

img = im2double(imread('cameraman.tif'));
% img = im2double(imread('Fig0459(a)(orig_chest_xray).tif'));
% img = im2double(imread('moon-8855057_1920.jpg'));

figure, imshow(img,[]); title('f_R = img original');
[row, col] = size(img);

%DFT - transf direta ***********************
F_R = zeros(row,col); % matriz para a parte real do espectro
F_I = zeros(row,col); % matriz para a parte imaginária do espectro
%transformada direta das linhas
f_R(1:col) = 0;
f_I(1:col) = 0;
n = 0:col-1;
for idx = 1:1:row   
    f_R(:) = img(idx, :); %parte real é igual a img
    f_I(:) = 0; % parte imaginária é igual a zero
    % f_R = f_R.*(-1).^n;
    % f_I = f_I.*(-1).^n;
    [R, I] = FT_Estudo (f_R, f_I);
    F_R(idx, :) = R(:); %F_R parte real do spectro
    F_I(idx, :) = I(:); %F_I parte imaginária do spectro
end
modulo=sqrt(F_R.^2+F_I.^2);
figure, imshow(log(0.01+(modulo)), []); title('log Modulo FT Linhas');

%transformada direta das colunas
clear f_R f_I n;
f_R(1:row) = 0;
f_I(1:row) = 0;
n=0:row-1;
for idx = 1:1:col  
    f_R(:) = F_R( : , idx);
    f_I(:) = F_I( : , idx);
    % f_R=f_R.*(-1).^n;
    % f_I=f_I.*(-1).^n;
    [R, I] = FT_Estudo (f_R, f_I);
    F_R( : , idx) = R(:);
    F_I( : , idx) = I(:);
end

modulo=sqrt(F_R.^2+F_I.^2);
figure, imshow(log(0.01+fftshift(modulo)), []); title('log Modulo do spectro')
