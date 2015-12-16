#!/bin/bash

for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	echo "linking $f ..."
	ln -sf ~/dotfiles/"$f" ~/"$f"
done
