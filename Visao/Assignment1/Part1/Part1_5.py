import cv2 as cv
import numpy as np
import random
import matplotlib.pyplot as plt

img = cv.imread('mrbean.jfif')

salt_prob = 0.01   
pepper_prob = 0.01
total_pixels = img.size
noisy = np.copy(img)

salt_count = int(total_pixels * salt_prob)
pepper_count = int(total_pixels * pepper_prob)

for _ in range(salt_count):
    i, j = random.randint(0, noisy.shape[0] - 1), random.randint(0, noisy.shape[1] - 1)
    noisy[i, j] = [255, 255, 255]  # White pixel

for _ in range(pepper_count):
    i, j = random.randint(0, noisy.shape[0] - 1), random.randint(0, noisy.shape[1] - 1)
    noisy[i, j] = [0, 0, 0]  


denoised_img = cv.medianBlur(noisy, 3)



plt.figure(figsize=(12, 8))

plt.subplot(1, 3, 1), plt.imshow(cv.cvtColor(img, cv.COLOR_BGR2RGB))
plt.title('Original Image'), plt.axis('off')

plt.subplot(1, 3, 2), plt.imshow(cv.cvtColor(noisy, cv.COLOR_BGR2RGB))
plt.title('Noisy Image (Salt & Pepper)'), plt.axis('off')

plt.subplot(1, 3, 3), plt.imshow(cv.cvtColor(denoised_img, cv.COLOR_BGR2RGB))
plt.title('Denoised Image (Median Filter)'), plt.axis('off')

plt.tight_layout()
plt.show()