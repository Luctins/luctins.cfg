#!/bin/bash

input=$1
output=$2
EXTRA_ARG=$3

FRAMES_D=./tmp_frames
PIDS=( )

mkdir -v $FRAMES_D

ffmpeg -i $input $FRAMES_D/%05d.bmp

#convert $input $FRAMES_D/%05d.bmp

mkdir -v $FRAMES_D/nobg

frames=$(ls $FRAMES_D/*.bmp); # echo $frames

for f in $frames; do
	convert $f \
			-fill none -fuzz 4% \
			-draw "matte 0,0 floodfill" -flop \
			-draw "matte 0,0 floodfill" -flip \
			-draw "matte 0,0 floodfill" -flop \
			-draw "matte 0,0 floodfill" -flip \
			${EXTRA_ARG} \
			-verbose "$FRAMES_D/nobg/$(basename $f)" &
	PIDS+="$! "
done

wait

OUTPUT_NAME=${input%.gif}_nobg.gif

echo 'output file: $OUTPUT_NAME'

convert -dispose background -delay 10 $(ls $FRAMES_D/nobg/*.bmp) "${OUTPUT_NAME}"

gifsicle -V -d 4 --crop-transparency "${OUTPUT_NAME}" \
		 -O2 --colors 256 --dither  -f -o $output

rm -rv $FRAMES_D
