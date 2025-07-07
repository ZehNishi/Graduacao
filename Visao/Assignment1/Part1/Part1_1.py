import cv2 as cv

img1 = cv.imread('1.jpg')
img2 = cv.imread('2.jpg')

img1 = cv.bitwise_not(img1)
img2 = cv.bitwise_not(img2)

cv.imshow('Imagem 1',img1)
cv.imshow('Imagem 2',img2)

cv.waitKey(0)
cv.destroyAllWindows()