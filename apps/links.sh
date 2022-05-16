#!/bin/env zsh

PREFIX=config/apps
CFG_PATH=$(realpath .. | sed "s#/home/$USER/##")
WORK_HOSTNAME=$(cat work_hostname)

function env_name () {
	[[ $(hostname) =~ '${WORK_HOSTNAME}.*' ]] && echo work || echo personal
}

# all paths are relative to ~/
if [ -f mappings ]; then
	source mappings
else
	echo 'please define path mappings'
fi

################################################################################
# create links

echo "prefix: $PREFIX"

cd ~/

# create link ~/config -> Dropbox/config
CFG_DIR=$( basename "$CFG_PATH" )
if [ ! -f "~/$CFG_DIR" ] || [ ! -e "~/$CFG_DIR" ]; then
	ln -s "$CFG_PATH" ~/
else
	echo "cfg path link already exists"
fi

for src dest in "${PATHS[@]}"; do
	if [ -f "$dest" ] || [ -d "$dest" ]; then
		if [ ! -e "$dest" ]; then
			echo 'broken symlink, removing'
			rm -v "$dest"
		else
			echo "File '$dest' already exists, skip"
			continue
		fi
	fi
	echo -en "$src -> $dest   "

	ln -vs "$src" "$dest"
done
