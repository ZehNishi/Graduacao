clear; clc; close all;

img = imread('sticknote_gray_01.png'); 


sigma = 5; 
bw_edges = edge(img, 'canny', [], sigma);

[H, theta, rho] = hough(bw_edges);

figure
imshow(imadjust(rescale(H)),[],...
       'XData',theta,...
       'YData',rho,...
       'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
colormap(gca,hot)

num_peaks = 4; 
peaks = houghpeaks(H,num_peaks,'Threshold',ceil(0.3*max(H(:))));

x = theta(peaks(:,2));
y = rho(peaks(:,1));
plot(x,y,'*','color','black');

lines = houghlines(bw_edges, theta, rho, peaks,'FillGap',5,'MinLength',7);

figure, imshow(img), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');