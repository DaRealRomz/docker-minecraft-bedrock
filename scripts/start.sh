#!/bin/bash
set -e

# download the server
cd $HOME/temp
rm -rf ./*
wget https://minecraft.azureedge.net/bin-linux/bedrock-server-$VERSION.zip -O server.zip
unzip -o server.zip
rm -f server.zip

# copy server files
cp {permissions.json,server.properties,whitelist.json} $HOME/data
rm -f permissions.json server.properties whitelist.json
cp -n ./* $HOME/data
rm -rf ./*

# move to the server directory
cd $HOME/data

# create the stdin pipe for the server console
rm -f $HOME/run/console
mkfifo $HOME/run/console

# start the server
LD_LIBRARY_PATH=. ./bedrock_server < <(tail -f $HOME/run/console)
rm -f rm -f $HOME/run/console
