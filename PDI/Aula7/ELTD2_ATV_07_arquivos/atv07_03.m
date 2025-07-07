clc, clear, close all

img = imread('rice.png');

t_values = 0.2:0.2:0.6;
s_values = 9:10:29;

figure;

plot_index = 1;


for t = t_values
    for s = s_values
        
        threshold = adaptthresh(img, t, 'NeighborhoodSize', [s s]);
        binaryImg = imbinarize(img, threshold);

      
        subplot(length(t_values), length(s_values), plot_index);
        imshow(binaryImg);
        title(sprintf('t = %.1f, s = %d', t, s));
        

        plot_index = plot_index + 1;
    end
end