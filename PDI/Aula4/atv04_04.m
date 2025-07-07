img = imread('flowervaseg.png');
Masc1 = [0,-1,0;-1,5,-1;0,-1,0];
Masc2 = [-1,-1,-1;-1,9,-1;-1,-1,-1];

img_Masc1 = conv2(double(img), Masc1, 'same');
img_Masc2 = conv2(double(img), Masc2, 'same');

img_Masc1 = uint8(img_Masc1);
img_Masc2 = uint8(img_Masc2);

figure;

subplot(1, 3, 1);
imshow(img);
title('Imagem Original');

subplot(1, 3, 2);
imshow(img_Masc1);
title('Imagem com OM');

subplot(1, 3, 3);
imshow(img_Masc2);
title('Imagem com LG');