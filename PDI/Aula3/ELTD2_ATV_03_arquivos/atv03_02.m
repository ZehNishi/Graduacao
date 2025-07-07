%Sigmoid
%Aloca uint8
%para depois usar funcao intlut (y1 é a LUT)
%Equação da sigmoide
slope = 0.05;
inflec = 127;
x = 0:1:255;
y1 = 1./(1 + exp(-slope*(x - inflec)));
y1n = mat2gray(y1); %Valores entre 0 e 1
y1n = uint8(y1n.*255); %Valores ente 0 e 255(inteiros)



%Imagem
img = imread('vpfig.png');

imag_piecewise = intlut(img, y1n);

%Plot
figure;
subplot(1, 2, 1);  
imshow(img);
title('Imagem Original');

subplot(1, 2, 2); 
imshow(imag_piecewise);
title('Imagem Transformada');

slopes = [0.01, 0.25, 0.1, 0.2, 0.5, 0.8];
figure;
for i = 1:length(slopes)
    slope = slopes(i);
    y1 = 1 ./ (1 + exp(-slope * (x - inflec))); 
    y1n = mat2gray(y1);  
    y1n = uint8(y1n * 255);  

    imag_piecewise = intlut(img, y1n);

    subplot(2, 3, i);
    imshow(imag_piecewise);
    title(['Slope = ' num2str(slope)]);

end