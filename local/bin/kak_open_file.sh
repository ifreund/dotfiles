#!/bin/sh
session_id=$1
client_id=$2
if git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
	target=$(git ls-files | zf -l 1024)
else
	target=$(rg --files | zf -l 1024)
fi
echo "eval -client ${client_id} edit -existing ${target}" | kak -p "${session_id}"
