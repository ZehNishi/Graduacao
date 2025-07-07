import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

images = [cv.imread(f'Dice/{i}.jpg') for i in range(1, 7)]

threshold_value = 70
binary_images = []

for img in images:
    gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    ret, th = cv.threshold(gray_img, threshold_value, 150, cv.THRESH_BINARY)
    binary_images.append(th)
binary_images = [255 - img for img in binary_images]

kernel = cv.getStructuringElement(cv.MORPH_ELLIPSE, (7, 7))


opened_images = []
for bin_img in binary_images:
    opened_img = cv.morphologyEx(bin_img, cv.MORPH_CLOSE, kernel)
    opened_img = cv.morphologyEx(opened_img,cv.MORPH_OPEN,kernel)
    opened_images.append(opened_img)

detected_circles = []
circle_counts = []

for i, img in enumerate(opened_images):
    circles = cv.HoughCircles(img, 
                              cv.HOUGH_GRADIENT, dp=1, minDist=10, 
                              param1=200, param2=10, minRadius=2, maxRadius=10)
    
    if circles is not None:
        circles = np.round(circles[0, :]).astype("int")
        detected_circles.append(circles)
        circle_counts.append(len(circles))
    else:
        detected_circles.append([])
        circle_counts.append(0) 

plt.figure(figsize=(15, 10))

for i, circles in enumerate(detected_circles):
    img_with_circles = images[i].copy()

    for (x, y, r) in circles:
        cv.circle(img_with_circles, (x, y), r, (0, 0, 255), 2)
        
    text = f'{circle_counts[i]}'
    cv.putText(img_with_circles, text, (10, 30), cv.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 20), 2, cv.LINE_AA)


    plt.subplot(4, 3, i+1) 
    plt.imshow(images[i]) 
    plt.axis('off')

    plt.subplot(4, 3, i+7) 
    plt.imshow(cv.cvtColor(img_with_circles, cv.COLOR_BGR2RGB)) 
    plt.axis('off')

plt.tight_layout()
plt.show()