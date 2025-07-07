# -*- coding: utf-8 -*-
"""
Editor Spyder

Este é um arquivo de script temporário.
"""

import numpy as np
import matplotlib.pyplot as plt
import pds

#n = np.arange(31)
#w0 = np.pi/20
#x = np.cos(w0*n)

#plt.stem(n, x)

n = np.arange(-2, 5)
plt.stem(n, pds.u(n))