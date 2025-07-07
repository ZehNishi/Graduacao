% função DFT na unha

function [R, I] = FT_Estudo(f_r, f_i);

N=size(f_r,2);
R(1:N)=0;
I(1:N)=0;

 idx_1=128;
 idx_2=129;
for u = 1 : N % u é o indice das frequencias
        acum_imag = 0; %acumula a soma dos produtos 
        acum_real = 0; %acumula a soma dos produtos 
        for n = 1 : N %x é o indice das amostras
            theta = 2*pi*(u-1)*(n-1)/N;
            acum_real = acum_real +   f_r(n)*cos(theta)  + f_i(n)*sin(theta);
            acum_imag = acum_imag + (-f_r(n)*sin(theta)) + f_i(n)*cos(theta);
        end
        R(u)=acum_real;
        I(u)=acum_imag;
end

