clc;
clear all;


% Eb = 1e-6;
% fc = 4e9;
% Rb = 51.84e6;
% Pr = 10*log10(Eb*Rb);
% L = 7;
% G = 50;
% Pl = G - Pr - L;
% 
% d = sqrt((10^(Pl/10)*(3*10^8/fc)^2)/(16*pi^2))



fc = 1.8e9;
c = 299792458;
lambda = c/fc;
Rb = 100e6;


No_db = -204 + 10*log10(Rb);


Pld0 = 16*pi^2/(lambda^2);
Pld0_db = 10*log10(Pld0);

Pr = 10 + No_db + 5;
EIRP = 32;
Gr = 6;
L = 5;

Plid_db = EIRP - Pr + Gr
Plid = 10^(Plid_db/10); 

d = (Plid/Pld0)^(1/4)
