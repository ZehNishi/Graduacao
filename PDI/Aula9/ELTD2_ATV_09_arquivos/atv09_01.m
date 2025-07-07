clear;
clc;
close all;


img = imread('greens.jpg');


R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

figure (1);
subplot(2, 2, 1), imshow(img), title('Original');
subplot(2, 2, 2), imshow(R), title('Red Channel');
subplot(2, 2, 3), imshow(G), title('Green Channel');
subplot(2, 2, 4), imshow(B), title('Blue Channel');

R_minus_GB = R - G - B;
binaryImg = imbinarize(R_minus_GB);

se = strel('diamond', 3);
binaryImg = imclose(binaryImg, se);
binaryImg = imopen(binaryImg, se);

se = strel('disk', 5);
binaryImg = imclose(binaryImg, se);
binaryImg = imopen(binaryImg, se);


figure (2);
subplot(2, 1, 1), imshow(R_minus_GB), title('Red - Green - Blue');
subplot(2, 1, 2), imshow(binaryImg), title('Binária');



