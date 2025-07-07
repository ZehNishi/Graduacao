clear;
clc;

Rb = 2e6;
fc = 915e6;
c = 299792458;
lambda = c/fc;
M = 32;
Pb = 1e-4;
No_db = -204;

d = 2e3;

Pl_d0 = 16*pi^2/(lambda^2);
Pl = 16*pi^2*d^2/(lambda^2);

Pl_db = 10*log10(Pl);

% Pb = 13/(4*log2(M))*qfunc(sqrt(log2(M)*snr/10));
snr = qfuncinv(Pb/13*(4*log2(M)))^2*10/log2(M);
snr_db = 10*log10(snr);
Eb_db = snr_db + No_db;
Pr_db = Eb_db + 10*log10(Rb);

% Assumindo Gr = Gt = 3dB
Gr_db = 3;
Gt_db = 3;
Pt_db = Pr_db + Pl_db - Gr_db - Gt_db

n = 3;
d_max = (Pl/Pl_d0)^(1/n)

Rs = Rb/log2(M);
B = Rs;
snr_ = (B/Rb)*(2^(Rb/B)-1);
snr_db_ = 10*log10(snr_);
Eb_db_ = snr_db_ + No_db;
Pr_db_ = Eb_db_ + 10*log10(Rb);
Pt_db_ = Pr_db_ + Pl_db - Gr_db - Gt_db

