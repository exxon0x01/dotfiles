#!/bin/bash

if [ -e ~/.emacs.d ]; then
	rm -r ~/.emacs.d
fi
for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	echo "linking $f ..."
	ln -sf ~/dotfiles/"$f" ~/"$f"
done
