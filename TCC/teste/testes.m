clc;  
clear;  
close all;  

dados = readtable('isolador.csv');

linha1 = dados{23, :};
linha2 = dados{22, :};
linha3 = dados{21, :};

figure(1),
plot(linha1, '-');
xlabel('Índice da leitura');
ylabel('Valor (m)');
grid on;

figure(2),
plot(linha2, '-');
xlabel('Índice da leitura');
ylabel('Valor (m)');
grid on;

figure(3),
plot(linha3, '-');
xlabel('Índice da leitura');
ylabel('Valor (m)');
grid on;