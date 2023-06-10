#!/bin/bash

gs -sOutputFile="$2" \
   -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.4 \
   -dNOPAUSE \
   -dPDFSETTINGS=/prepress \
   -dBATCH \
   "$1"
