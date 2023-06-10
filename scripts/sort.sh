#!/bin/env zsh

mkdir trash sorted other 2>&1 1>/dev/null

for f in *; do
 	xdg-open $f
 	vared -p "enter new file name for [$f]: " -c FILE_NAME
 	
	case "$FILE_NAME" in 
		d)
			mv "$f" "trash/"
		;;
		s)
			mv "$f" "other/"
		;;
		*)
			mv $f "sorted/${FILE_NAME}__$f"
		;;
	esac

	FILE_NAME=""
done
