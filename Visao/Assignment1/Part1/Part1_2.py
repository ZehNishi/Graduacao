import cv2 as cv

img = cv.imread('3.jpg')

(h, w) = img.shape[:2]

center = (w // 2, h // 2)

rotation_matrix = cv.getRotationMatrix2D(center, 45, 1.0)

rotated_image = cv.warpAffine(img, rotation_matrix, (w, h))

cv.imshow('Original', img)
cv.imshow('Rotacionada', rotated_image)

cv.waitKey(0)
cv.destroyAllWindows()