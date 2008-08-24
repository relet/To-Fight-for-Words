#!/usr/bin/env python

print """
  to fight for words - Copyright (C) 2008 Thomas Hirsch
  This program comes with ABSOLUTELY NO WARRANTY;
  This is free software, and you are welcome to redistribute it under the
  conditions of the GNU General Public Licence version 3 (GPLv3)
  see: http://www.gnu.org/licenses/gpl-3.0.html
"""

import os

SEPARATOR = os.path.normpath('/');              # find out what a SEPARATOR looks like on this os
DATAPATH = "." + SEPARATOR + "data" + SEPARATOR # where to find data files (.x models)
WORDLIST = "ngerman.bz2"

SOFTWARE_VERSION = "svn"+'$Revision: 1 $'[11:-2] # automatically set by subversion on checkout

print "Debug information:"
print "  You are using software revision "+SOFTWARE_VERSION
print ""

words = []
letters = {
  'a':0.0651,
  'b':0.0189,
  'c':0.0306,
  'd':0.0508,
  'e':0.1740,
  'f':0.0166,
  'g':0.0301,
  'h':0.0476,
  'i':0.0755,
  'j':0.0027,
  'k':0.0121,
  'l':0.0344,
  'm':0.0253,
  'n':0.0978,
  'o':0.0251,
  'p':0.0079,
  'q':0.0002,
  'r':0.0700,
  's':0.0758,
  't':0.0615,
  'u':0.0435,
  'v':0.0067,
  'w':0.0189,
  'x':0.0003,
  'y':0.0004,
  'z':0.0113,
}

def weightedChoice(dic):
  select = random()
  total = 0.0
  for letter, prob in dic.iteritems():
    total += prob
    if select < total:
      return letter
  return None

FIELD_SIZE = 15

### IMPORTS ###########################################################

import sys
import time
import bz2

from random import random, randint, choice
from pandac.PandaModules import *

from math import sin, cos, pi

### READ WORD LIST INTO DICTIONARY ####################################

wordlist = bz2.BZ2File(DATAPATH + "words/" + WORDLIST, "r")
for line in wordlist:
  words.append(line.rstrip().lower())
words.sort()

word = "" # the word being typed currently
paths = []

### INIT GAME FIELD ###################################################

FIELD_EMPTY  = 0
FIELD_TENT   = 1 
FIELD_FORT   = 2 
FIELD_TOWER  = 3 
FIELD_CASTLE = 4  

class Field:
  #letter   (char)
  #textnode (Node)
  #tile     (Node)
  #owner   (1|2)
  #feature (Node)
  #level   (empty, owned, built_1-4)
  def __init__(self):
    self.owner    = 0
    self.feature  = None
    self.level    = FIELD_EMPTY
    self.letter   = None
    self.tile     = None
    self.textnode = None

field = []
for i in range(FIELD_SIZE):
  field.append([])
  for j in range(FIELD_SIZE):
    field[i].append(Field())

def randomChar():
  return weightedChoice(letters)

def randomize():
  for i in range(FIELD_SIZE):
    for j in range(FIELD_SIZE):
      field[i][j].letter=randomChar()

randomize()

### IMPORTS - PART II: Start the 3D enine #############################

import direct.directbase.DirectStart
from direct.task import Task

font = loader.loadFont(DATAPATH+"fonts/mainfram.ttf")

### PLACE LETTERS #####################################################

for i in range(FIELD_SIZE):
  for j in range(FIELD_SIZE):
    letter = TextNode('_')
    letter.setText(field[i][j].letter)
    letter.setFont(font)
    letter.setTextColor(1,1,1,1)
    letter.setAlign(TextNode.ACenter)
    textNodePath = render.attachNewNode(letter)
    textNodePath.setScale(1.5,1.5,1.5)
    textNodePath.setPos(-.1 - FIELD_SIZE + i*2 , 75, -.5 - FIELD_SIZE + j*2)
    field[i][j].textnode=letter

### place LIGHTS ######################################################
#default: no shading, full colours

#not directional, but a lit ball somewhere above the stage
#sun  = PointLight('sun')
#sunp = render.attachNewNode(sun)
#sunp.setPos(20,25,10)
#render.setLight(sunp)

### LOAD and place MODELS #############################################

tileModel  = loader.loadModel(DATAPATH+"models/tile.x")
tileGrass = hidden.attachNewNode("grass")
tileRed   = hidden.attachNewNode("red")
tileBlue  = hidden.attachNewNode("blue")
tileModel.instanceTo(tileGrass)
tileModel.instanceTo(tileRed)
tileModel.instanceTo(tileBlue)
  
castle  = loader.loadModel(DATAPATH+"models/castle.x")
tower   = loader.loadModel(DATAPATH+"models/tower.x")
fort    = loader.loadModel(DATAPATH+"models/fort.x")
tent    = loader.loadModel(DATAPATH+"models/tent.x")

castle.setScale(1.5,1.5,1.5)
fort.setScale(1.5,1.5,1.5)
tent.setScale(1.5,1.5,1.5)
tower.setScale(1.5,1.5,1.5)

### Load and apply textures ############################################

texGrass = loader.loadTexture(DATAPATH+"textures/grass.jpg")
texRed = loader.loadTexture(DATAPATH+"textures/redtile.jpg")
texBlue = loader.loadTexture(DATAPATH+"textures/bluetile.jpg")

texCastle = loader.loadTexture(DATAPATH+"textures/castle.jpg")
texTent = loader.loadTexture(DATAPATH+"textures/tent.jpg")

tileGrass.setTexture(texGrass)
tileRed.setTexture(texRed)
tileBlue.setTexture(texBlue)
castle.setTexture(texCastle)
tent.setTexture(texTent)
fort.setTexture(texCastle)  # how very resourceful!
tower.setTexture(texCastle) # how very resourceful!

### TILE PLACEMENT HELPER FUNCTIONS###################################

def setOwner(i,j,owner):
  f = field[i][j]
  f.owner = owner
  if f.tile:
    f.tile.removeNode()
  nutile = render.attachNewNode("t"+str(i)+str(j))
  if owner==0:
    tileGrass.instanceTo(nutile)
  elif owner==1:
    tileRed.instanceTo(nutile)
  elif owner==2:
    tileBlue.instanceTo(nutile)
  nutile.setPos(-FIELD_SIZE + 2*i, 76, -FIELD_SIZE + 2*j)
  f.tile=nutile

def setBuildLevel(i,j,level):
  f = field[i][j]
  f.level = level
  if f.feature:
    f.feature.removeNode()
  if level==FIELD_EMPTY:
    return
  nutile = render.attachNewNode("feat"+str(i)+str(j))
  if level==FIELD_TENT:
    tent.instanceTo(nutile)
  elif level==FIELD_FORT:
    fort.instanceTo(nutile)
  elif level==FIELD_TOWER:
    tower.instanceTo(nutile)
  elif level==FIELD_CASTLE:
    castle.instanceTo(nutile)
  nutile.setPos(-FIELD_SIZE + 2*i, 76, -FIELD_SIZE + 2*j)
  f.feature=nutile

### INIT GAME FIELD ##################################################

CURRENT_PLAYER = 1

for i in range(FIELD_SIZE):
  for j in range(FIELD_SIZE):
    tile = render.attachNewNode("t"+str(i)+str(j))
    tile.setPos(-FIELD_SIZE + 2*i, 76, -FIELD_SIZE + 2*j)
    tileGrass.instanceTo(tile)    
    field[i][j].tile = tile

setOwner(2,3,1)
setOwner(3,3,1)
setOwner(4,3,1)
setOwner(3,2,1)
setOwner(3,4,1)

k = FIELD_SIZE - 4
setOwner(k-1,k,2)
setOwner(k,k,2)
setOwner(k+1,k,2)
setOwner(k,k-1,2)
setOwner(k,k+1,2)

setBuildLevel(3,3,FIELD_CASTLE)
setBuildLevel(k,k,FIELD_CASTLE)

### place CAMERA ######################################################
#default camera
cameraAngle = 45

def setCamera(diff = 0):
  global cameraAngle
  cameraAngle = cameraAngle + diff
  base.camera.setHpr(0,cameraAngle,0) #45deg angle sideways
  base.camera.setPos(0,80-80*cos(cameraAngle*pi/180),0-80*sin(cameraAngle*pi/180))

setCamera(cameraAngle) # why would this not work at all?

### SET UP Keyboard control ##########################################

def gotKeypress(letter):
  global word, paths

  letterFound = False
  newpaths = []
  for i in range(FIELD_SIZE):
    for j in range(FIELD_SIZE):
      tile = field[i][j]
      if tile.letter==letter:
        if tile.owner == 0 or tile.owner == CURRENT_PLAYER:
          if len(word) == 0:
            neighbourOwned = False
            for k in range(i-1,i+2):
              for l in range(j-1,j+2):
                if (k>-1) and (l>-1): #lists wrap around at index < 0
                  try: 
                    if field[k][l].owner == CURRENT_PLAYER:
                      neighbourOwned = True
                  except:
                    pass
            if neighbourOwned:
              newpaths.append([(i,j)]) #a new list containing one coordinate pair
              letterFound = True
          else:
            for path in paths:
              if (i,j) in path:
                continue
              endi,endj = path[-1]
              if abs(i-endi)<2 and abs(j-endj)<2:
                newpaths.append(path + [(i,j)])
                letterFound = True
  if letterFound:
    word += letter
    paths = newpaths
    for i in range(FIELD_SIZE):
      for j in range(FIELD_SIZE):
        tile = field[i][j]
        tile.textnode.setTextColor(1,1,1,1)  
        for path in paths:
          if (i,j) in path:
            tile.textnode.setTextColor(1,0,0,1)  
  #print "new word: "+word

def unmarkField():
  "remove all marks and color highlights."
  global word 

  word = ""
  paths = []
  for line in field:
    for tile in line:
      tile.textnode.setTextColor(1,1,1,1)  

def sendWord():
  global CURRENT_PLAYER

  print "sendWord"
  if word in words:
    print "IT'S A WORD!"
    for i in range(FIELD_SIZE):
      for j in range(FIELD_SIZE):
        tile = field[i][j]
        for path in paths:
          if (i,j) in path:
            setOwner(i,j,CURRENT_PLAYER)
            tile.letter = randomChar()
            tile.textnode.setText(tile.letter)
   
    #then (do building and erasing action; send word to partner)
    CURRENT_PLAYER = 3-CURRENT_PLAYER # toggle 1|2
  unmarkField()

def undoLetter():
  print "undoLetter"	
  unmarkField()

base.accept('escape', sys.exit )             #exit on esc
for i in letters.keys():
  base.accept(i, gotKeypress, [i])
base.accept('enter', sendWord)
base.accept('backspace', undoLetter)

### SET UP Mouse control #############################################
#base.disableMouse()

### TEST ###
run()

