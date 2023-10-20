#!/bin/zsh

makefile()
{
    mkdir -p "$(dirname "$1")" && touch "$1"
}
