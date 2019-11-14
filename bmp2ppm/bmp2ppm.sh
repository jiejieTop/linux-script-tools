#!/bin/bash
if [ " $1" == " " ];
then
    echo "usage:$0 bmp_file"
    exit 0
fi

if [ -f "$1" ]
then
    echo $1
else
    echo "no find file [$1]"
    exit 0
fi

name=${1%%.*}
bmptopnm $1 > $name.pnm
pnmquant 224 $name.pnm > $name.clut224.pnm
pnmtoplainpnm $name.clut224.pnm > $name.ppm
rm $name.pnm $name.clut224.pnm 