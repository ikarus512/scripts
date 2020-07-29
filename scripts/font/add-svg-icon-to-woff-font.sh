#!/usr/bin/python

# Add new icon from svg file to woff font

# Prerequisites (Ubuntu 18):
#     sudo apt install -y fontforge python-fontforge
#
# Fontforge docs:
#     https://fontforge.org/docs/scripting/python/fontforge.html#glyph

import fontforge
import os.path
from shutil import copyfile

woff       = './font.woff'
woffOrig   = './font-orig.woff'
resultWoff = woff

testSvg='./untitled-font-1.svg'
testEot='./untitled-font-1.eot'
testTtf='./untitled-font-1.ttf'
testWoff='./untitled-font-1.woff'

if not os.path.isfile(woffOrig):
    copyfile(woff, woffOrig)

font = fontforge.open(woffOrig) # open original

glyph = font.createChar(0xE002, 'icon-name-e002')  # create (or find existing) character at unicode codepoint (and name it)
glyph.importOutlines('./icon-name-e002.svg')       # new icon file

glyph = font.createChar(0xE003, 'icon-name-e003')  # create (or find existing) character at unicode codepoint (and name it)
glyph.importOutlines('./icon-name-e003.svg')       # new icon file

font.generate(resultWoff) # save result woff

# Save also test fonts for manual check using ./test.html
font.generate(testSvg)
font.generate(testEot)
font.generate(testTtf)
font.generate(testWoff)

# Also manually add new icon descriptions/codes/names to files:
# ./_icons.scss
