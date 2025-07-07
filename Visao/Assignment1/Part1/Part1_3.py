import cv2 as cv
import numpy as np

img = cv.imread('Mona_Lisa.jpg')

gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY) 
gray = cv.equalizeHist(gray)
gray = cv.GaussianBlur(gray, (3,3), cv.BORDER_DEFAULT)


lap = cv.Laplacian(gray, cv.CV_8U)
lap = cv.convertScaleAbs(lap,1,10)
lap = np.uint8(np.absolute(lap))
lap = cv.bitwise_not(lap)




cv.imshow('Mona Lisa (Sketch)', lap)

cv.waitKey(0)
