clear;
clc;

k = 11;
n = 15;
t = 1;

Rb = 1e6;
FER = 5e-2;
d = 250;
amb = 4;
fc = 2.4e9;
c = 299792458;
lambda = c/fc;
No_db = -204;
% BPSK
Gt_db = 3;
Gr_db = 3;
mar_db = 0.5;
alpha = 0.25;
BER = 1 - power(1 - FER,1/k);
Pld0 = 16*pi^2/(lambda^2);
Pld0_db = 10*log10(Pld0);
Pl_db = Pld0_db + 10*amb*log10(d);

SNR_db = 5.28;
Eb_db = SNR_db + No_db;
Pr_db = Eb_db + 10*log10(Rb);
Pt_db = Pr_db + Pl_db - Gt_db - Gr_db - mar_db;
disp("BPSK Pt_db:");
disp(Pt_db);


% 16-QAM
SNR_db_16qam = 8.9166;
Eb_db_16qam = SNR_db_16qam + No_db;
Pr_db_16qam = Eb_db_16qam + 10*log10(Rb);
Pt_db_16qam = Pr_db_16qam + Pl_db - Gt_db - Gr_db - mar_db;
disp("16-QAM Pt_db:");
disp(Pt_db_16qam);

% Com codigo
Rb_cod = Rb*n/k;
SNR_db_cod = 4.631;
Eb_db_cod = SNR_db_cod + No_db;
Pr_db_cod = Eb_db_cod + 10*log10(Rb_cod);
Pt_db_cod = Pr_db_cod + Pl_db - Gt_db - Gr_db - mar_db;
disp("BPSK Pt_db_cod:");
disp(Pt_db_cod);

% 16-QAM
SNR_db_16qam_cod = 8.085;
Eb_db_16qam_cod = SNR_db_16qam_cod + No_db;
Pr_db_16qam_cod = Eb_db_16qam_cod + 10*log10(Rb_cod);
Pt_db_16qam_cod = Pr_db_16qam_cod + Pl_db - Gt_db - Gr_db - mar_db;
disp("16-QAM Pt_db_cod:");
disp(Pt_db_16qam_cod);

% Largura de banda minima
Rs = Rb;
B = Rs*(1+alpha);
disp("Banda mínima BPSK:")
disp(B);

Rs_cod = Rb_cod;
B_cod = Rs_cod*(1+alpha);
disp("Banda mínima BPSK com código:")
disp(B_cod);

Rs_16qam = Rb/4;
B_16qam = Rs_16qam*(1+alpha);
disp("Banda mínima 16-QAM:")
disp(B_16qam);

Rs_16qam_cod = Rb_cod/4;
B_16qam_cod = Rs_16qam_cod*(1+alpha);
disp("Banda mínima 16-QAM com código:")
disp(B_16qam_cod);


% Limite de Shannon

SNR_db_min = B/Rb*(2^(Rb/B)-1);
diff = SNR_db - SNR_db_min;
disp("Distância do BPSK:")
disp(diff);
SNR_db_min_cod = B_cod/Rb_cod*(2^(Rb_cod/B_cod)-1);
diff_cod = SNR_db_cod - SNR_db_min_cod;
disp("Distância do BPSK com código:")
disp(diff_cod);

% 16-QAM

SNR_db_16qam_min = B_16qam/Rb*(2^(Rb/B_16qam)-1);
diff_16qam = SNR_db_16qam - SNR_db_16qam_min;
disp("Distância do 16-QAM:")
disp(diff_16qam);
SNR_db_16qam_min_cod = B_16qam_cod/Rb_cod*(2^(Rb_cod/B_16qam_cod)-1);
diff_16qam_cod = SNR_db_16qam_cod - SNR_db_16qam_min_cod;
disp("Distância do 16-QAM com código:")
disp(diff_16qam_cod);



