clear;
clc;
close all;

frames = readmatrix('frames.csv');



imageHeight = 240;
imageWidth = 320;
numImages = 20;
images = cell(1, numImages);

for i = 1:numImages
    images{i} = frames((i-1)*imageHeight+1:imageHeight+(i-1)*imageHeight,:);
    images{i} = imrotate(images{i}, 180);
end


minValue = inf;
maxValue = -inf;
minPos = [];
maxPos = [];
minImage = [];
maxImage = [];

for i = 1:numImages
    currentImage = images{i};
    
    currentMin = min(currentImage(currentImage > 26));
    currentMax = max(currentImage(:));

    if currentMin < minValue
        minValue = currentMin;
        [minRow, minCol] = find(images{i} == minValue);
        minPos = [minRow, minCol];
        minImage = images{i};
    end
    
    if currentMax > maxValue
        maxValue = currentMax;
        [maxRow, maxCol] = find(images{i} == maxValue);
        maxPos = [maxRow, maxCol];
        maxImage = images{i};
    end
end

disp(['Valor mínimo encontrado: ', num2str(minValue)]);
disp(['Posição do valor mínimo: ', num2str(minPos(1)), ' ', num2str(minPos(2))]);

disp(['Valor máximo encontrado: ', num2str(maxValue)]);
disp(['Posição do valor máximo: ', num2str(maxPos)]);


figure;
imshow(minImage, []);
colormap("hot");
hold on;
plot(minPos(2), minPos(1), 'b+', 'MarkerSize', 10);

figure;
imshow(maxImage, []);
colormap("hot");
hold on;
plot(maxPos(2), maxPos(1), 'b+', 'MarkerSize', 10); 