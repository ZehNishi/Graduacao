%Imagem
img = imread('42049_20-200.png');

img_vector = img(:);
hist_manual = zeros(1,256);

for i = 1:length(img_vector)

    pixel_value = img_vector(i);      
    hist_manual(pixel_value + 1) = hist_manual(pixel_value + 1) + 1;

end

hist_imhist = imhist(img);

figure;

subplot(1, 2, 1); 
bar(0:255, hist_manual, 'b');
xlabel('Valor do Pixel');
ylabel('Frequência');
title('Histograma Manual');

subplot(1, 2, 2);  
bar(0:255, hist_imhist, 'r'); 
xlabel('Valor do Pixel');
ylabel('Frequência');
title('Histograma imhist');

figure
imhist(img)