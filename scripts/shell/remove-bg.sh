#!/bin/bash

input=$1
output=$2
EXTRA_ARG=$3

FRAMES_D=./tmp_frames
PIDS=( )


mkdir -v $FRAMES_D
mkdir -v $FRAMES_D/nobg

convert $input $FRAMES_D/%05d.bmp

frames=$(ls $FRAMES_D/*.bmp); # echo $frames

for f in $frames; do
    convert $f \
            -fill none -fuzz 12% \
            -draw "matte 0,0 floodfill" -flop \
            -draw "matte 0,0 floodfill" -flip \
            -draw "matte 0,0 floodfill" -flop \
            -draw "matte 0,0 floodfill" -flip \
            ${EXTRA_ARG} \
            -verbose "$FRAMES_D/nobg/$(basename $f)" &
    PIDS+="$! "
done

#echo $PIDS

wait


OUTPUT_NAME=${input%.gif}_nobg.gif

echo 'output file: $OUTPUT_NAME'

convert -dispose background -delay 10 $(ls $FRAMES_D/nobg/*.bmp) "${OUTPUT_NAME}"

gifsicle -V -d 5 --crop-transparency -b \
         "${OUTPUT_NAME}" \
         -O2 --crop-transparency -f --colors 256 --crop-transparency

rm -rv $FRAMES_D
