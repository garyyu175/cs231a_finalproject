#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sat Mar 17 17:44:32 2018

@author: root
"""

import numpy as np

faces=np.load('face.npz')
faces.keys() #['test', 'train', 'valid']

test=faces['test']
t0=test[0]
t1=test[1]