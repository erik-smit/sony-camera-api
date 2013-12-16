#!/usr/bin/python

import httplib
import struct
import binascii
import pprint

import pygame
import time
import io

In=1
pygame.init()
w = 640
h = 480
size=(w,h)
screen = pygame.display.set_mode(size) 

conn = httplib.HTTPConnection("172.24.254.148:60152")
conn.request("GET", "/liveview.JPG?%211234%21http%2dget%3a%2a%3aimage%2fjpeg%3a%2a%21%21%21%21%21")
res = conn.getresponse()

while True:
  commonHeaderLength = 1 + 1 + 2 + 4
  commonHeader = res.read(commonHeaderLength)

  payloadHeaderLength = 4 + 3 + 1 + 4 + 1 + 115
  payloadHeader = res.read(payloadHeaderLength)

  jpegSize = struct.unpack('>i','\x00'+payloadHeader[4:7])[0]
  paddingSize = ord(payloadHeader[7:8])
 
  jpegData = res.read(jpegSize)
  paddingData = res.read(paddingSize)

  img = pygame.image.load(io.BytesIO(jpegData))
  screen.blit(img,(0,0)) 
  pygame.display.flip()
