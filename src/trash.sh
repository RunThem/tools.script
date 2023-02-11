#!/usr/bin/env bash

# Copyright (c) 2023 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

LANG=us

root_path="~/.local/share/Trash"
prefix=$(date '+%y-%m-%d-%H-%M-')

for f in ${@}; do
  mv ${f} ${root_path}/${prefix}$(basename ${f})
done
