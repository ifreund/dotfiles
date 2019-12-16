#!/usr/bin/bash

num_updates=$(checkupdates | wc -l)

if [ $num_updates -gt 0 ]; then
    echo "{\"text\": \"$num_updates updates\", \"class\": \"warning\"}" 
else
    echo "{\"text\": \"up to date\"}" 
fi
