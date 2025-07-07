close all; %Fecha todas imagens
clear all;%Limpa todas variáveis
clc;%Limpa a janela de comandos
G = imread('cameraman.tif');%Carrega a imagem
nr = size(G,1);%Número de linhas
nc = size(G,2);%Número de colunas
[X,Y] = meshgrid(1:nr,1:nc);%Coordenadas de cada pixel
N = nr*nc;%Número de pixels
I = [X(:)';%Cada coluna de I representa uma coordenada
 Y(:)';
 ones(1,N)];
ang = 45*pi/180;%Ângulo de rotação
T = [ cos(ang) sin(ang) 0;%Matriz de transformação para rotação
 -sin(ang) cos(ang) 0;
 0 0 1];


K = T*I;%Coordenadas transformadas
temp1 = min(K, [], 2);%Encontra as menores coordenadas 
m = repmat(temp1, 1, N);%Temp1 repetido N vezes
temp2 = K - m;%Para centralizar as coordenadas


Kadj = 1 + floor(temp2);%Arredonda as coordenadas 
nrOut = max(Kadj(1,:));%Valor máximo da coordenada x
ncOut = max(Kadj(2,:));%Valor máximo da coordenada y
Gout = uint8(zeros(nrOut, ncOut));%Matriz com os valores máximos de x e y transformados
for k = 1:length(Kadj)
 Gout(Kadj(1,k), Kadj(2,k)) = G(I(1,k), I(2,k));%Preenche a matriz com os valores da imagem original
end

imshow(Gout);%Mostra a imagem, a imagem tem buracos porque não foi feita uma interpolação para preenche-los