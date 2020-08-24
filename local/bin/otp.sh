#!/bin/sh
oathtool  --totp --base32 --digits=6 $1
