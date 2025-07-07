%Piecewise Linear
%Aloca uint8
%para depois usar funcao intlut (y1 é aLUT)
y1 = uint8(zeros([1 256]));
%Equação da reta inferior y = (1/3)*x
y1(1:97) = (1/3)*(0:96);
%Equação da reta intermediária y = 3*x -256
y1(98:161) = 3*(97:160) - 256;
%Equação da reta superior y = (1/3)*x + 170
y1(162:256) = (1/3)*(161:255) + 170;


%Imagem
img = imread('vpfig.png');

imag_piecewise = intlut(img, y1);

%Plot
figure;
subplot(1, 2, 1);  
imshow(img);
title('Imagem Original');

subplot(1, 2, 2); 
imshow(imag_piecewise);
title('Imagem Transformada');
