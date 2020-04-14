#!/bin/bash
set -e

# move to the server directory
cd $HOME/data

# download server.jar if it does not exist
# if [ ! -e bedrock_server ]
# then
  wget https://minecraft.azureedge.net/bin-linux/bedrock-server-$VERSION.zip -O server.zip
  unzip server.zip
  rm server.zip
# fi

# create the stdin pipe for the server console
rm -f $HOME/run/console
mkfifo $HOME/run/console

# start the server
LD_LIBRARY_PATH=. ./bedrock_server < <(tail -f $HOME/run/console)
rm -f rm -f $HOME/run/console
