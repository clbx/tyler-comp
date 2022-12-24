#!/bin/bash

downloads=$(cat modlist.yaml | yq e '.mods[].id')
stellaris_id=$(cat modlist.yaml | yq e '.stellaris')

steam_download_dir="/root/.steam/steamcmd/workshop/steamapps/workshop/content/281990/"

download_command="steamcmd +force_install_dir ./workshop/ +login anonymous"
for id in $downloads
do
    download_command+=" +workshop_download_item $stellaris_id $id"
done
download_command="${download_command} +quit"
eval $download_command


# Build the Modpack
# Reverse the array
rev_downloads=$(echo $downloads|tr ' ' '\n'|tac|tr '\n' ' ')
echo $rev_downloads
mkdir -p /output


for id in $rev_downloads
do
    cp -R $steam_download_dir$id/* /output
done
