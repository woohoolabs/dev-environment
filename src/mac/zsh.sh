#!/usr/bin/env bash

if [ "$1" == "config" ]; then

    echo -e "Copying global Zsh configuration files..."

    cp $BASEPATH/config/zsh/.zshrc ~/.zshrc
    cp $BASEPATH/config/zsh/.zshrc_woohoo.zsh ~/.zshrc_woohoo.zsh

elif [ "$1" == "help" ]; then

    echo -e "Available subcommands:"
    echo -e "    config: Generate configuration"
    echo -e "    help  : List subcommands"

else

    $BASEPATH/woohoo zsh help

fi
