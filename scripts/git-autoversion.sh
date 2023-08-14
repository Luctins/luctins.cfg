#!/bin/bash

SUB_PATH="$2"
D_PATH="$1"
F_PATH="$D_PATH/$SUB_PATH"

echo "sync: $D_PATH f: $F_PATH"

# GIT_D="$(git rev-parse --show-toplevel)/.git"
# DATE=$(date --rfc-3339=seconds)

cd $D_PATH

case $F_PATH in
    */.git/*)
        echo "in git directory"
        exit 1
        ;;

    *)
        git add $SUB_PATH
        git commit -m "updated $F_PATH"
        rm -rf $SUB_PATH
        ;;
esac
