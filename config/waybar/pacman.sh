#!/bin/sh

num_updates=$(checkupdates | wc -l)

if [ $num_updates -gt 1 ]; then
    echo "{\"text\": \"$num_updates updates\", \"class\": \"warning\"}"
elif [ $num_updates -eq 1 ]; then
    echo "{\"text\": \"$num_updates update\", \"class\": \"warning\"}" 
else
    echo "{\"text\": \"up to date\"}" 
fi
