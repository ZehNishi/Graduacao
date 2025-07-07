img = imread('salt-and-pepper1.tif');
img_mediana = zeros(size(img));
nr = size(img,1);
nc = size(img,2);

for l = 1:nr
    for c = 1:nc
        if (l == 1) || (l == nr) || (c == 1) || (c == nc)

            img_mediana(l,c) = 0;
        
        else

            x = sort([img(l-1,c-1),img(l-1,c),img(l-1,c+1),img(l,c-1),img(l,c),img(l,c+1),img(l+1,c-1),img(l+1,c),img(l+1,c+1)]);
            img_mediana(l,c) = x(5);

        end

        
    end
end

%img_mediana = uint8(img_mediana);

figure;

subplot(1, 2, 1);
imshow(img);
title('Imagem Original');

subplot(1, 2, 2);
imshow(img_mediana);
title('Imagem Mediana');