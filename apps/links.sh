#!/bin/env zsh

# strict mode
set -euo pipefail
IFS=$'\n\t'

PREFIX="/home/$USER/config/apps"
CFG_PATH=$(realpath .. | sed "s#/home/$USER/##")

case ${1:-} in
    work)
        ENV_NAME=work
        ;;

    *)
        read -r "yesno?Use defalt personal env? [y/n]: ";
        if [[ ! "${yesno}" =~ [Yy](es)? ]]; then
            echo "no confirmation, abort";
            exit 1
        fi

        ENV_NAME=personal
        ;;
esac

echo "env: $ENV_NAME"

if [ -f "./setup.sh.priv" ]; then
    # NOTE: this file sets up a few variables and can also run other checks
    # related to the system setup
	source "./setup.sh.priv"
else
	echo 'please define configuration file'
fi

################################################################################
# create links

echo "prefix: $PREFIX"

cd ~/

# all paths in the PATHS array are relative to ~/

# create link ~/config -> ${CFG_PATH}
CFG_DIR=$( basename "$CFG_PATH" )
echo "cfg_dir: $CFG_DIR"

if [ ! -r"$CFG_DIR" ]; then
	ln -sv "$CFG_PATH" .
else
	echo "cfg path link already exists"
fi

for src dest in "${PATHS[@]}"; do
	  if [ -f "$dest" ] || [ -d "$dest" ]; then
		    if [ ! -e "$dest" ]; then
			      echo 'broken symlink, removing'
			      rm -v "$dest"
		    else
			      echo " - '$dest' already exists, skip"
			      continue
		    fi
    else
	      ln -vs "$src" "$dest"
	  fi
done
