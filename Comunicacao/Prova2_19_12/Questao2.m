clear;
clc;

% Dados do enunciado
fc = 900e6;
c = 299792458;
lambda = c/fc;
Pt = 100e-3;
Pt_db = 10*log10(Pt);
Sensibilidade_r_db = -105 - 30;
% sensibilidade = Pr/Gr
d = 500;
% Espaço livre até 20 metros, maior que isso n = 3.75
n = 3.75;
Gt_db = -5;
Gr_db = 10;

% Calculo do Pl para d0 = 1
Pl_d0 = 16*pi^2/(lambda^2);
Pl_d0_db = 10*log10(Pl_d0);

% Caulculo do Pl até 20 metros considerando espaço livre
Pl_20 = 16*pi^2*20^2/(lambda^2);
Pl_20_db = 10*log10(Pl_20);

% Calculo do Pl até 500 metros considerando n =3.75
Pl_480_db = Pl_20_db + 10*n*log10(480/20);
Pl_480 = 10^(Pl_480_db/10);

% Calculo do Pl total
% Pl = Pl_480 + Pl_20;
Pl_db = Pl_480_db

Pr_db = Pt_db + Gr_db + Gt_db - Pl_db

% Calculo da margem
Ma_db = Sensibilidade_r_db - Pt_db - Gt_db + Pl_db;
fprintf('Margem: %.4f dB\n', Ma_db);


