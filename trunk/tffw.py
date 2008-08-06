#!/usr/bin/env python

print """
  wordwars - Copyright (C) 2008 Thomas Hirsch
  This program comes with ABSOLUTELY NO WARRANTY;
  This is free software, and you are welcome to redistribute it under the
  conditions of the GNU General Public Licence version 3 (GPLv3)
  see: http://www.gnu.org/licenses/gpl-3.0.html
"""

import os

SEPARATOR = os.path.normpath('/');              # find out what a SEPARATOR looks like on this os
DATAPATH = "." + SEPARATOR + "data" + SEPARATOR # where to find data files (.x models)
WORDLIST = "wordlist.de.bz2"

SOFTWARE_VERSION = "svn"+'$Revision: 1 $'[11:-2] # automatically set by subversion on checkout

print "Debug information:"
print "  You are using software revision "+SOFTWARE_VERSION
print ""

words = []
vowels = ['a','e','i','o','u']
consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']

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

### INIT GAME FIELD ###################################################

FIELD_EMPTY  = 0
FIELD_TENT   = 1 
FIELD_FORT   = 2 
FIELD_TOWER  = 3 
FIELD_CASTLE = 4  

STATUS_NONE   = 0
STATUS_MARKED = 1
STATUS_2MARK  = 2
STATUS_END    = 3

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
    self.status   = STATUS_NONE

field = []
for i in range(0,15):
  field.append([])
  for j in range(0,15):
    field[i].append(Field())

def randomize():
  for i in range(0,15):
    for j in range(0,15):
      if randint(0,1)==0:
        char = choice(vowels)
      else:
        char = choice(consonants)
      field[i][j].letter=char

randomize()

### IMPORTS - PART II: Start the 3D enine #############################

import direct.directbase.DirectStart
from direct.task import Task

font = loader.loadFont(DATAPATH+"fonts/mainfram.ttf")

### PLACE LETTERS #####################################################

for i in range(0,15):
  for j in range(0,15):
    letter = TextNode('_')
    letter.setText(field[i][j].letter)
    letter.setFont(font)
    letter.setTextColor(1,1,1,1)
    letter.setAlign(TextNode.ACenter)
    textNodePath = render.attachNewNode(letter)
    textNodePath.setScale(1.5,1.5,1.5)
    textNodePath.setPos(-.1 - 15 + i*2 , 75, -.5 - 15 + j*2)
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
  nutile.setPos(-15 + 2*i, 76, -15 + 2*j)
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
  nutile.setPos(-15 + 2*i, 76, -15 + 2*j)
  f.feature=nutile

### INIT GAME FIELD ##################################################

for i in range(0,15):
  for j in range(0,15):
    tile = render.attachNewNode("t"+str(i)+str(j))
    tile.setPos(-15 + 2*i, 76, -15 + 2*j)
    tileGrass.instanceTo(tile)    
    field[i][j].tile = tile

setOwner(2,3,1)
setOwner(3,3,1)
setOwner(4,3,1)
setOwner(3,2,1)
setOwner(3,4,1)

setOwner(10,11,2)
setOwner(11,11,2)
setOwner(12,11,2)
setOwner(11,10,2)
setOwner(11,12,2)

setBuildLevel(3,3,FIELD_CASTLE)
setBuildLevel(11,11,FIELD_CASTLE)

setBuildLevel(1,1,FIELD_TENT)
setBuildLevel(1,2,FIELD_FORT)
setBuildLevel(1,3,FIELD_TOWER)
setBuildLevel(1,4,FIELD_CASTLE)

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
  for i in field:
    for tile in i:
      if tile.letter==letter:
        print "ok, this letter exists."
        #if field is marked or better, ignore
        #now check if word is empty (first letter to type)
        #  then if neighbour is an owned space
        #    then make space STATUS_END. highlight letter in colour of player (red|blue)
        #or if neighbour is a STATUS_END space
        #  then set space STATUS_2MARK. in next iteration move all STATUS_END -> STATUS_MARKED and STATUS_2MARK -> STATUS_END

def sendWord():
  print "sendWord"	
  #check if word is in words
  #then (do building and erasing action; send word to partner)
  #else unmark all spaces

base.accept('escape', sys.exit )             #exit on esc
for i in vowels:
  base.accept(i, gotKeypress, [i])
for i in consonants:
  base.accept(i, gotKeypress, [i])
base.accept('enter', sendWord)

### SET UP Mouse control #############################################
#base.disableMouse()

### TEST ###
run()

