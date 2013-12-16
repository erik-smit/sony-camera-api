#!/usr/bin/python

import httplib
import struct
import binascii
import pprint

import matplotlib
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import matplotlib.animation as animation
import numpy as np
from PIL import Image
from pylab import *

import io

conn = httplib.HTTPConnection("172.24.254.148:60152")
conn.request("GET", "/liveview.JPG?%211234%21http%2dget%3a%2a%3aimage%2fjpeg%3a%2a%21%21%21%21%21")
res = conn.getresponse()

fig = plt.figure()

im = plt.imshow(np.random.random((10,10)))

def moarLive(*args):

  commonHeaderLength = 1 + 1 + 2 + 4
  commonHeader = res.read(commonHeaderLength)

  payloadHeaderLength = 4 + 3 + 1 + 4 + 1 + 115
  payloadHeader = res.read(payloadHeaderLength)

  jpegSize = struct.unpack('>i','\x00'+payloadHeader[4:7])[0]
  paddingSize = ord(payloadHeader[7:8])
 
  jpegData = res.read(jpegSize)
  paddingData = res.read(paddingSize)

  image_as_file = io.BytesIO(jpegData)
  image_as_pil = Image.open(image_as_file)

  im.set_data(image_as_pil)
  return im,

ani = animation.FuncAnimation(fig, moarLive, interval=50, blit=True)
plt.show()
