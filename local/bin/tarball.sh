#!/bin/sh

set -e

name="$1"
if [ -z "$name" ]; then
	echo "argument required: name"
	exit 1
fi

mkdir "$name"
for file in $(git ls-files --recurse-submodules)
do
	path="$name/$(dirname "$file")"
	mkdir -p "$path"
	cp -r "$file" "$path"
done

tar -cavf "$name".tar.gz "$name"
