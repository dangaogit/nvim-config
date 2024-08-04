#!/bin/bash

if ! command -v nvim &> /dev/null
then
  echo "Please install nvim 0.10+"
  exit 404
else
  echo "nvim installed."
fi 

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

