#!/bin/bash

# install script

for f in .??*; do
    [[ -d "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    echo $f
    # ln -s "$f" "~/$f"
done
