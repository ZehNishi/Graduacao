clear;
clc;
close all;

pasta = 'Provas';
arquivos = dir(fullfile(pasta, '*.jpeg'));
idxGabarito = startsWith({arquivos.name}, 'Gabarito');
arquivosGabarito = arquivos(idxGabarito);
arquivosOutros = arquivos(~idxGabarito);
arquivos = [arquivosGabarito; arquivosOutros];

respGabaritos = cell(4,1);
pesos = ones(1, 50)*2;
% pesos = [0.07841133, 0.15684352, 0.23527571, 0.3137079, 0.39214009, 0.47057228,...
%  0.54900447, 0.62743666, 0.70586885, 0.78430104, 0.86273324, 0.94116543, ...
%  1.01959762, 1.09802981, 1.176462, 1.25489419, 1.33332638, 1.41175857, ...
%  1.49019076, 1.56862295, 1.64705514, 1.72548733, 1.80391952, 1.88235171, ...
%  1.9607839, 2.0392161, 2.11764829, 2.19608048, 2.27451267, 2.35294486, ...
%  2.43137705, 2.50980924, 2.58824143, 2.66667362, 2.74510581, 2.823538, ...
%  2.90197019, 2.98040238, 3.05883457, 3.13726676, 3.21569896, 3.29413115, ...
%  3.37256334, 3.45099553, 3.52942772, 3.60785991, 3.6862921, 3.76472429, ...
%  3.84315648, 3.92158867];

%Devem somar 100

for x = 1:length(arquivos)
    caminhoCompleto = fullfile(pasta, arquivos(x).name);
    [~, nomeBase, ~] = fileparts(arquivos(x).name);
    nome = regexp(nomeBase, '\D+', 'match', 'once');

    img = imread(caminhoCompleto);
    img = imresize(img, [NaN, 1414]);
    
    img_gray = im2gray(img);
    img_bin = imbinarize(img_gray, 'adaptive', 'Sensitivity', 0.7);
    img_bin = ~img_bin;
    
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

    max_pixels = 0;
    prova_atual = 0;
    for k = 1:4
        
        bbox = tipoProva(k).BoundingBox;
        region = imcrop(img_bin, bbox);

        num_pixels = sum(region(:) == 1);
        

        if num_pixels > max_pixels
            if num_pixels > threshold_num_pixel
                max_pixels = num_pixels;
                prova_atual = k;
            else
                prova_atual = 0;
            end
        end
    end
    if nome ~= "Gabarito"
        fprintf("Aluno: %s\n",nome);
        if prova_atual == 0
            fprintf("Tipo de prova não marcadado\n\n");
        else
            fprintf("Prova número: %d\n", prova_atual);
            acertos = respostas == respGabaritos{prova_atual};
            nota = sum(pesos .* acertos);
            fprintf("Nota: %f\n\n",nota);
        end
    else
        respGabaritos{prova_atual} = respostas;
    end
    
    
end
