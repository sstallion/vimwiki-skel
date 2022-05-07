#!/bin/sh -e
# install.sh [instance] - install Vimwiki to $HOME

MDWIKI_URL="http://dynalon.github.io/mdwiki/mdwiki-latest-debug.html"

echo "Updating submodules..."
git submodule update --init --recursive

echo "Installing MDwiki..."
curl -L -o index.html --progress-bar $MDWIKI_URL

# Update title using our configuration file;
# see: http://dynalon.github.io/mdwiki/#!customizing.md#Configuration
title=`sed -n 's#.*"title": "\(.*\)",*#\1#p' config.json`
if [ ! -z "$title" ]; then
	echo "Updating MDwiki..."
	sed "s#<title>.*</title>#<title>$title</title>#" index.html > .index.html
	mv .index.html index.html
fi

link_name=$HOME/.vimwiki
if [ ! -z "$1" ]; then
	link_name="$link_name-$1"
fi
if [ -e $link_name -a ! -h $link_name ]; then
	echo "Skipping $link_name; not a symbolic link"
else
	echo "Installing $link_name..."
	ln -fns $PWD $link_name
fi

echo "Done."
exit 0
