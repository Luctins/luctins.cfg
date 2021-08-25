#!/bin/bash

#create self group
sudo groupadd me
sudo usermod -a -G me luctins

#create other other user
sudo useradd mluctins
for g in $(groups); do
	sudo usermod -a -G $g mluctins
done

DOTFILE_P='~/MEGA/config-files/dotfiles/'
for f in $(ls $DOTFILE_P); do
	ln $f ~/
done
