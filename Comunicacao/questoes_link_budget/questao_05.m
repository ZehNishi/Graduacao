clc;
clear;

% Neste exerc´ıcio vamos comparar dois r´adios compat´ıveis com o padr˜ao IEEE 802.15.4 (a base
% do protocolo Zigbee), um da Texas Instruments – CC2420 – e outro da Atmel – AT86RF231.
% O CC2420 tem m´axima potˆencia de transmiss˜ao de 0 dBm, sensibilidade de -95 dBm e taxa
% de 250 kbps. O AT86RF231 tem m´axima potˆencia de transmiss˜ao de 3 dBm, sensibilidade de
% -101 dBm a uma taxa de 250 kbps. Compare o alcance dos dois r´adios considerando o espa¸co
% livre e um cen´ario onde o expoente de perda de percurso ´e n = 4 e d0 = 1 m. A frequˆencia
% de portadora ´e de 2.4 GHz. Quanto maior ´e o alcance do AT86RF231? Como dois r´adios que
% seguem o mesmo padr˜ao podem ter alcances t˜ao diferentes? Procure folhear os datasheets
% dos dois r´adios em busca de outras diferen¸cas. Ambas as empresas (al´em de outras empresas)
% possuem outros r´adios no padr˜ao 802.15.4. Como escolher o r´adio mais apropriado?

Rb = 250e3;
n = 4;
d0 = 1;
fc = 2.4e9;
c = 299792458;
lambda = c/fc;
PL_d0 = (16*pi^2*d0^2)/(lambda^2);
PL_d0_dB = 10*log10(PL_d0);

Pt_CC2420_dBm = 0;
Pt_CC2420_dB = Pt_CC2420_dBm - 30;
Pr_CC2420_dBm = -95;
Pr_CC2420_dB = Pr_CC2420_dBm - 30;
PL_CC2420_dB = Pt_CC2420_dB - Pr_CC2420_dB;

d_CC2420 = 10^((PL_CC2420_dB-PL_d0_dB)/(n*10))

Pt_AT86RF231_dBm = 3;
Pt_AT86RF231_dB = Pt_AT86RF231_dBm - 30;
Pr_AT86RF231_dBm = -101;
Pr_AT86RF231_dB = Pr_AT86RF231_dBm - 30;
PL_AT86RF231_dB = Pt_AT86RF231_dB - Pr_AT86RF231_dB;

d_AT86RF231 = 10^((PL_AT86RF231_dB-PL_d0_dB)/(n*10))

dif_alcance_AT86RF231_CC2420 = d_AT86RF231 - d_CC2420   %diferenca em m
porc_alcance = (d_AT86RF231/d_CC2420-1)*100             %diferenca em %


