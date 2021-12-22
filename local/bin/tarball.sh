#!/bin/sh

set -e

name=$1
if [ -z "$name" ]; then
	echo "argument required: name"
	exit 1
fi

mkdir $name
git ls-files --recurse-submodules | xargs cp --parents -r -t $name
tar -cavf $name.tar.gz $name
