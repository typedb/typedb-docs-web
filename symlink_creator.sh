#!/usr/bin/env bash

# set -xe

absolute_path_prefix=$(pwd)

whitelist_dirs=(client_api concept_api views) # only create symlinks if the file is contained within the given directory names

for original in $(find docs -name '*.yml'); do
    symlink=${original#"docs/"} # remove prefix
    digits=${symlink:0:2}
    re='^[0-9]+$'
    if [[ $digits =~ $re ]] ; then
        symlink=${symlink:3} # remove page number
    fi
    symlink="${symlink//-/_}" # repalce - with _
    symlink="${symlink/references\//}" # remove /references

    absolute_symlink="$absolute_path_prefix/_data/$symlink" # .yml symlink path
    absolute_original="$absolute_path_prefix/$original" # original .yml file path

    IFS='/' read -r -a splited_symlink <<< "$symlink" # split symlink into array by "/" as delimeter
    dir=${splited_symlink[0]} # get the directory to check against whitelist_dirs

    if [[ " ${whitelist_dirs[@]} " =~ " ${dir} " ]]; then # allowed to create symlink
        mkdir -p "$(dirname $absolute_symlink)" # create the symlink's path if non-existent (-p)
        ln -s $absolute_original $absolute_symlink

        # add created symlinks to .gitignore
        # because the counterpart of this bash script creates symlinks for deployment to heroku
        if ! grep -q "_data/$dir" .gitignore; then
            echo "_data/$dir" >> .gitignore
        fi
    fi
done