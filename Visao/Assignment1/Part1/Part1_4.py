import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

img = cv.imread('building.tif', cv.IMREAD_GRAYSCALE)

# Sobel Edge Detection
sobel_x = cv.Sobel(img, cv.CV_64F, 1, 0, ksize=5)  # Horizontal edges
sobel_y = cv.Sobel(img, cv.CV_64F, 0, 1, ksize=5)  # Vertical edges

# Prewitt Edge Detection
kernel_prewitt_x = np.array([[-1, 0, 1], [-1, 0, 1], [-1, 0, 1]])
kernel_prewitt_y = np.array([[1, 1, 1], [0, 0, 0], [-1, -1, -1]])
prewitt_x = cv.filter2D(img, -1, kernel_prewitt_x)  # Horizontal edges
prewitt_y = cv.filter2D(img, -1, kernel_prewitt_y)  # Vertical edges

# Laplacian Edge Detection
laplacian = cv.Laplacian(img, cv.CV_8U)


plt.figure(figsize=(12, 8))

plt.subplot(2, 3, 1), plt.imshow(img, cmap='gray')
plt.title('Original Image'), plt.axis('off')

plt.subplot(2, 3, 2), plt.imshow(np.abs(sobel_x), cmap='gray')
plt.title('Sobel - Horizontal'), plt.axis('off')

plt.subplot(2, 3, 3), plt.imshow(np.abs(sobel_y), cmap='gray')
plt.title('Sobel - Vertical'), plt.axis('off')

plt.subplot(2, 3, 4), plt.imshow(prewitt_x, cmap='gray')
plt.title('Prewitt - Horizontal'), plt.axis('off')

plt.subplot(2, 3, 5), plt.imshow(prewitt_y, cmap='gray')
plt.title('Prewitt - Vertical'), plt.axis('off')

plt.subplot(2, 3, 6), plt.imshow(np.abs(laplacian), cmap='gray')
plt.title('Laplacian'), plt.axis('off')

plt.tight_layout()
plt.show()