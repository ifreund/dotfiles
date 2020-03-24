#!/bin/sh
session_id=$1
client_id=$2
target=$(rg --files | sk)
echo "eval -client ${client_id} edit -existing ${target}" | kak -p "${session_id}"
