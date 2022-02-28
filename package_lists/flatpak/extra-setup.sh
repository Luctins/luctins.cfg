#!/bin/sh

#fix theming issue with flatpaks
flatpak --user override --filesystem=/home/$USER/.icons/:ro
