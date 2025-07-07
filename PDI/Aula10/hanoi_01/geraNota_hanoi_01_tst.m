% geraNota_hanoi_01_tst [script]
clear all, close all, clc

load resultado.mat; %nome do arquivo
saidaAlgoritmo = resultado; %nome da variavel

gabarito = [
%Y R B G L 
3 3 3 3 3;%hanoi_01_01
2 3 3 3 3;%hanoi_01_02
2 1 3 3 3;%hanoi_01_03 tst
2 1 1 3 3;%hanoi_01_04
2 1 1 2 3;%hanoi_01_05 tst
2 3 1 2 3;%hanoi_01_06
2 1 3 2 3;%hanoi_01_07 tst
1 2 2 3 1;%hanoi_01_08
1 2 3 3 1;%hanoi_01_09 tst
1 3 3 1 2;%hanoi_01_10
2 3 3 2 2;%hanoi_01_11 tst
2 3 1 2 2;%hanoi_01_12 tst
3 3 1 2 2;%hanoi_01_13
2 2 1 2 2;%hanoi_01_14 tst
1 3 3 2 1;%hanoi_01_15 tst
1 2 3 2 1;%hanoi_01_16
1 2 3 3 1;%hanoi_01_17
3 2 3 3 1;%hanoi_01_18
2 2 3 1 1;%hanoi_01_19 tst
3 2 3 1 1;%hanoi_01_20
3 1 3 1 1;%hanoi_01_21
3 2 2 2 2;%hanoi_01_22 tst
3 1 2 2 2;%hanoi_01_23
2 1 2 2 2;%hanoi_01_24 tst
2 3 2 2 2;%hanoi_01_25
3 3 2 1 2;%hanoi_01_26
3 3 1 1 2;%hanoi_01_27
2 2 2 2 2;%hanoi_01_28 tst
1 1 1 1 1;%hanoi_01_29
2 2 2 2 1;%hanoi_01_30
3 3 3 3 1;%hanoi_01_31 tst
2 2 2 3 1;%hanoi_01_32 tst
1 3 2 3 1;%hanoi_01_33
1 2 2 3 1;%hanoi_01_34 tst
1 3 3 3 1;%hanoi_01_35
];

errado = abs(saidaAlgoritmo - gabarito);
errado = logical(sum(errado, 2));
certo = ~errado;
certo_tst = certo([3 5 7 9 11 12 14 15 19 22 24 28 31 32 34])'