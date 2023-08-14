#!/bin/env zsh

PREFIX="/home/$USER/config/apps"

CFG_PATH=$(realpath .. | sed "s#/home/$USER/##")

ENV_NAME=$([[ "$(hostname)" =~ "$(cat work_hostname.priv).*" ]] && echo work || echo personal)

echo "env: $ENV_NAME"

# all paths are relative to ~/
if [ -f mappings.priv ]; then
	source mappings.priv
else
	echo 'please define path mappings'
fi

################################################################################
# create links

echo "prefix: $PREFIX"

cd ~/

# create link ~/config -> ${CFG_PATH}
CFG_DIR=$( basename "$CFG_PATH" )
echo "cfg_dir: $CFG_DIR"

if [ ! -r"$CFG_DIR" ]; then
	ln -sv "$CFG_PATH" .
else
	echo "cfg path link already exists"
fi

echo

for src dest in "${PATHS[@]}"; do
	  if [ -f "$dest" ] || [ -d "$dest" ]; then
		    if [ ! -e "$dest" ]; then
			      echo 'broken symlink, removing'
			      rm -v "$dest"
		    else
			      echo "File '$dest' already exists, skip"
			      continue
		    fi
    else
	      ln -vs "$src" "$dest"
	  fi
done
