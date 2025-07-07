clear;
clc;
close all;


img = imread("Provas\José.jpeg");
img = imresize(img, [NaN, 1414]);
% figure;
imshow(img);

img_gray = im2gray(img);
img_bin = imbinarize(img_gray, 'adaptive', 'Sensitivity', 0.7);
img_bin = ~img_bin;
% figure;
imshow(img_bin);

stats = regionprops(img_bin, 'BoundingBox');

largura_minima = 25;
altura_minima = 25;

largura_maxima = 60;
altura_maxima = 60;

maiorBBox.BoundingBox = [0 0 0 0]; 
alternativas = struct('BoundingBox', cell(254, 1));
index = 1;

for k = 1:length(stats)
    bbox = stats(k).BoundingBox;
    largura = bbox(3);
    altura = bbox(4);
    
    if largura >= largura_minima && largura <= largura_maxima && altura >= altura_minima && altura <= altura_maxima
        alternativas(index).BoundingBox = stats(k).BoundingBox;
        index = index + 1;
    else
        if altura > maiorBBox.BoundingBox(4)
            maiorBBox.BoundingBox = stats(k).BoundingBox;
        end
    end
end

bboxDentro = false(length(alternativas), 1);


for i = 1:length(alternativas)
    bboxAlternativa = alternativas(i).BoundingBox;

    if bboxAlternativa(1) >= maiorBBox.BoundingBox(1) && ...
       bboxAlternativa(2) >= maiorBBox.BoundingBox(2) && ...
       (bboxAlternativa(1) + bboxAlternativa(3)) <= (maiorBBox.BoundingBox(1) + maiorBBox.BoundingBox(3)) && ...
       (bboxAlternativa(2) + bboxAlternativa(4)) <= (maiorBBox.BoundingBox(2) + maiorBBox.BoundingBox(4))
        bboxDentro(i) = true;
    end
end

alternativas = alternativas(bboxDentro,:);
alternativasOrdenadas = reshape([alternativas.BoundingBox], 4, []).';

sortedByY = sortrows(alternativasOrdenadas, 2);
group1 = sortedByY(1:4, :);
group1 = sortrows(group1, 1);
alternativasOrdenadas = setdiff(alternativasOrdenadas, group1, 'rows');
alternativasOrdenadas = sortrows(alternativasOrdenadas, 2);

tipoProva = struct('BoundingBox', cell(4, 1));
for i = 1:length(tipoProva)
    tipoProva(i).BoundingBox = group1(i, :);
end

numGrupos = 25;
tamanhoGrupo = size(alternativasOrdenadas, 1) / numGrupos;
grupos = cell(numGrupos, 1);
for i = 1:numGrupos
    inicio = (i-1) * tamanhoGrupo + 1;
    fim = i * tamanhoGrupo;
    grupos{i} = alternativasOrdenadas(inicio:fim, :);
end

group2 = [];
group3 = [];

for i = 1:numGrupos
    sortedByX = sortrows(grupos{i}, 1);
    
    group2 = [group2; sortedByX(1:5, :)];
    group3 = [group3; sortedByX(end-4:end, :)];
end

alternativasOrdenadas = [group2; group3];
for i = 1:length(alternativas)-4
    alternativas(i).BoundingBox = alternativasOrdenadas(i, :);
end

questoes = cell(50, 1);

for i = 1:50
    startIdx = (i - 1) * 5 + 1;
    endIdx = i * 5;
    questoes{i} = alternativas(startIdx:endIdx);
end





% figure;
imshow(img);
hold on;
for k = 1:length(maiorBBox)
    bbox = maiorBBox(k).BoundingBox;
    rectangle('Position', bbox, 'EdgeColor', 'r', 'LineWidth', 1.5);
    x = bbox(1); 
    y = bbox(2);
    text(x, y - 10, sprintf('A %d', k), 'Color', 'blue', 'FontSize', 10, 'FontWeight', 'bold');
end
hold off;

% figure;
imshow(img);
hold on;
for k = 1:length(tipoProva)
    bbox = tipoProva(k).BoundingBox;
    rectangle('Position', bbox, 'EdgeColor', 'r', 'LineWidth', 1.5);
    x = bbox(1); 
    y = bbox(2);
    text(x, y - 10, sprintf('A %d', k), 'Color', 'blue', 'FontSize', 10, 'FontWeight', 'bold');
end
hold off;

% figure;
imshow(img);
hold on;
for k = 1:length(alternativas)
    bbox = alternativas(k).BoundingBox;
    rectangle('Position', bbox, 'EdgeColor', 'r', 'LineWidth', 1.5);
    x = bbox(1); 
    y = bbox(2);
    text(x, y - 10, sprintf('A %d', k), 'Color', 'blue', 'FontSize', 10, 'FontWeight', 'bold');
end
hold off;

respostas = zeros(1, 50);
threshold_num_pixel = 550;

for k = 1:50
    max_pixels = 0;
    resposta_atual = 0;
    
    for j = 1:5
        bbox = questoes{k}(j).BoundingBox;
        region = imcrop(img_bin, bbox);

        num_pixels = sum(region(:) == 1);

        if num_pixels > max_pixels
            if num_pixels > threshold_num_pixel
                max_pixels = num_pixels;
                resposta_atual = j;
            else
                resposta_atual = 0;
            end
        end
    end

    respostas(k) = resposta_atual;
end

disp(respostas);