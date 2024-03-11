#!/bin/env bash

IN_IMG=${1:?"missing \$1: input image file"}
OUT_IMG=${2:?"missing \$2: output file"}

# optional
OUTLINE_COLOR=${3:-white}
OUTLINE_WIDTH=${4:-15}

BACKGROUND_COLOR=red

if [ "${FILL_COLOR}" == "${MASK_COLOR}" ]; then
    BACKGROUND_COLOR=black
fi

convert $IN_IMG \
        -morphology close disk \
        -blur ${OUTLINE_WIDTH}x65000 -threshold 0 -negate \
        -alpha extract \
        -transparent white \
        -fill $OUTLINE_COLOR -opaque black \
        $IN_IMG -composite \
        $OUT_IMG
