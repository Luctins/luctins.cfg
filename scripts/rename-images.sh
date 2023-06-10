#!/usr/bin/env zsh


OUTD=out
TRASH=trash
SORT=sort
D=( $OUTD $TRASH $SORT )

for d in ${D[@]}; do 
    mkdir $d; 
done

TOSORT=($(ls *.(png|jpg|webp|qoi) | sort -d))
START_COUNT=$(echo $TOSORT | wc -w)
COUNT=1

for f in ${TOSORT[@]}; do
    xdg-open $f; # open file for visualization
    vared -p "$COUNT/$START_COUNT - enter new file name for [$f]: " -c FILE_NAME;

    case "$FILE_NAME" in
        m) # [m] move but no rename
            mv $f $OUTD/
            ;;
        d) # [d]elete
            echo -e "\tTrashed $f"
            mv "$f" $TRASH/
            ;;
        s) # [s]eparate
            echo "Separated $f"
            mv "$f" $SORT/
            ;;
        *)
            mv $f "out/${FILE_NAME}__$f"
        ;;
    esac
    let COUNT++
    FILE_NAME="";
done
