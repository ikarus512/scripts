# Size minimization
 colorDepth=8;  colorsNum=10
 colorDepth=16; colorsNum=20
 fs=$(ls *.png); for f in $fs; do fn=${f%.*}; convert $f -resize 1000x -dither none -matte -depth $colorDepth -deconstruct -layers optimizePlus -colors $colorsNum -strip $fn.gif; done
