#!/usr/bin/env bash

set -xe

absolute_path_prefix=$(pwd)

for original in $(find docs -name '*.yml'); do
    symlink=${original#"docs/"} # remove prefix
    symlink=${symlink:3} # remove page number
    symlink="${symlink//-/_}" # repalce - with _
    symlink="${symlink/references\//}" # remove /references

    absolute_symlink="$absolute_path_prefix/_data/$symlink" # .yml symlink path
    absolute_original="$absolute_path_prefix/$original" # original .yml file path

    mkdir -p "$(dirname $absolute_symlink)" # create the symlink's path if non-existent (-p)

    ln -s $absolute_original $absolute_symlink
    if ! grep -q "./_data/$symlink" .gitignore; then
        echo "\n./_data/$symlink" >> .gitignore
    fi
done