#!/bin/sh
pull_id=$1
git fetch upstream pull/$pull_id/head:$pull_id
