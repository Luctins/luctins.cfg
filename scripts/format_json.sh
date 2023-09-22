#!/usr/bin/bash

F=${1:?"no input files"}

while :; do
	echo "file: $F"

	cat $F | json_reformat | sponge $F

	shift;

  F=$1

	if [[ -z $F ]]; then
      echo "done"
		  break;
	fi
done
