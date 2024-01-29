#!/usr/bin/env bash

# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

set -x

argc=${#}
argv=(${@})

path=""
array=(`pwd | tr '/' ' '`)

for w in ${array[@]}; do
  if [ "${w}" == "maincode" ]; then
    path=${path}/${w}
    break
  fi
  path=${path}/${w}
done

[ ! -e "${path}/version.h" ] && exit

echo "build loading..."

if [ ${#} -eq 1 ]; then
        make -C ${path} clean
fi

make -C ${path} all -j20

bin=${HOME}/code/bin/maincode.bin
[ -e ${bin} ] && rm ${bin}
cp ${path}/maincode.bin ${bin}
