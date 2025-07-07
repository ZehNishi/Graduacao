% adbteo_05 [script]
clear all, close all, clc
% Cria imagem sintética g
w = 256;
objt = 192; fundo = 64; rdn = 10;
g = makeImSynthHex(w,objt,fundo,rdn);
g = im2double(g);
Sh = fspecial('sobel');
gSh = imfilter(g,Sh,'replicate','conv'); %Gradiente horizontal
Sv = Sh';
gSv = imfilter(g,Sv,'replicate','conv'); %Gradiente vertical
% Imagem de magnitude do gradiente
S = sqrt(gSv.^2 + gSh.^2);
%Imagem de magnitude pela soma dos absolutos
S2 = abs(gSv) + abs(gSh);
% Normaliza
gSh = mat2gray(gSh);
gSv = mat2gray(gSv);
S = mat2gray(S);
S2 = mat2gray(S2);


figure;
subplot(2, 3, 1), imshow(g, []), title('Original (g)');
subplot(2, 3, 2), imshow(gSh, []), title('Gradiente Horizontal (gSh)');
subplot(2, 3, 3), imshow(gSv, []), title('Gradiente Vertical (gSv)');
subplot(2, 3, 4), imshow(S, []), title('Magnitude (S)');
subplot(2, 3, 5), imshow(S2, []), title('Absoluto (S2)');
