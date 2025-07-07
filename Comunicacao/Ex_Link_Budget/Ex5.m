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

n = 4;
fc = 2.4e9;
c = 299792458;
lambda = c/fc;
Pld0 = 16*pi^2/(lambda^2);
Pld0_db = 10*log10(Pld0);


%CC2420 

Pt_db = 0 - 30;
Pr_db = -95 - 30;
Rb = 250e3;
Rb_db = 10*log10(Rb);

Plid_db = Pt_db - Pr_db;
Plid = 10^(Plid_db/10);

d = (Plid/Pld0)^(1/n);
disp(d);

%AT86RF231420 

Pt_db = 3 - 30;
Pr_db = -101 - 30;
Rb = 250e3;
Rb_db = 10*log10(Rb);

Plid_db = Pt_db - Pr_db;
Plid = 10^(Plid_db/10);

d = (Plid/Pld0)^(1/n);
disp(d);

% Resposta: o AT86RF231420 tem alcance de 16.0489 a mais. Devido a
% difenreça entre potencias minimas de cada um.