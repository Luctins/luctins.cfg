#!/bin/bash
for f in $(ls); ln -sv $(realpath $f) ~/.config/
