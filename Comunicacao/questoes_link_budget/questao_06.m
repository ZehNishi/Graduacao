clc;
clear;

% 6. Considere o r´adio CC1100 da Texas Instruments, um r´adio geral (n˜ao segue um padr˜ao espec´ıfico), 
% que pode operar nas faixas de 315, 433, 868 e 915 MHz. A potˆencia de transmiss˜ao
% varia de -30 a +10 dBm. O r´adio suporta taxas de 1.2 kbps a 500 kbps. A sensibilidade
% depende da taxa e da frequˆencia de portadora. Por exemplo, para 315 MHz a sensibilidade a
% 1.2 kbps ´e de -111 dBm e a 500 kbps ´e de -88 dBm. Determine o m´aximo e o m´ınimo alcance
% para cada uma das frequˆencias de portadora poss´ıveis. Os dados de sensibilidade para as
% outras frequˆencias precisam ser obtidos do datasheet do r´adio. Assuma espa¸co livre e tamb´em
% um ambiente com expoente de perda de percurso de n = 4 e d0 = 1 m.

n = 4;
d0 = 1;
c = 299792458;
Rb_min = 1.2e3;
Rb_max = 500e3;
Pt_min_dBm = -30;
Pt_min_dB = Pt_min_dBm - 30;
Pt_max_dBm = 10;
Pt_max_dB = Pt_max_dBm - 30;

%para 315MHz
fc = 315e6;
lambda = c/fc;
PL_d0 = (16*pi^2*d0^2)/(lambda^2);
PL_d0_dB = 10*log10(PL_d0);

Pr_min_dBm = -111;
Pr_min_dB = Pr_min_dBm - 30;
Pr_max_dBm = -88;
Pr_max_dB = Pr_max_dBm - 30;

PL_min_dB = Pt_min_dB - Pr_max_dB;
PL_max_dB = Pt_max_dB - Pr_min_dB;

d_min = 10^((PL_min_dB-PL_d0_dB)/(n*10))
d_max = 10^((PL_max_dB-PL_d0_dB)/(n*10))

% fc_2 = 433e6;
% fc_3 = 868e6;
% fc_4 = 915e6;
