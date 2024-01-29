#!/usr/bin/env bash

# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

set -x

# /bin/rm -f lib/lib_bcm_sdk/lib*.a

svn update --accept e

temp=$(mktemp) && svn st | grep -e "^M" -e "^A" -e "^D" > ${temp}

sed -i -e '/version.h/d' -e '/readline/d' ${temp} && nvim ${temp} && sed -i -e 's/M[ ]*//' -e 's/A[ ]*//' -e 's/D[ ]*//' ${temp}

for line in `cat ${temp}`; do
  svn changelist push_repo ${line}
done

rm -f ${temp} && nvim ~/.config/commit

svn commit --changelist push_repo -F ~/.config/commit && svn update

[ -e '__patch' ] && rm __patch
