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
    images{i} = mat2gray(images{i});
    images{i} = imrotate(images{i}, 180);

end

figure;
for i = 1:numImages
    subplot(4, 5, i);
    imshow(images{i}, []);
    colormap("hot");
end

