#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 14 14:10:11 2024

@author: jose
"""

import numpy as np
import matplotlib.pyplot as plt
import pds

n = np.arange(0, 131)

w1 = np.pi/10
x1 = np.cos(w1*n)

w2 = 3.1415/10 
x2 = np.cos(w2*n)

plt.figure(1)
plt.stem(n, x1, "b")
plt.figure(2)
plt.stem(n, x2, "r")
