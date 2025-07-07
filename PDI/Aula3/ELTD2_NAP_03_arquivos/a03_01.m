% a03_01 [script]
clc, clear, close all

% g = imread('grays8bit.png'); %pra testar (f�cil de inspecionar os valores)
g = imread('xray01.png');
figure; imshow(g)

% Fun��o de transforma��o
y = uint8(255:-1:0);
figure;
plot(y); xlim([0 255]); ylim([0 255]);
gIdx = double(g)+1; % double(gu) pq 255+1...
% ...em um uint8 ocorre overflow (MATLAB n�o
% ..."gira" fazendo voltar pra 0; ele trunca em 255).
% +1 pq MATLAB � one-based indexing.

gtu = y(gIdx); % sa�da gtu � da mesma classe 
% da fun��o de transforma��o y
figure; imshow(gtu);