#!/usr/bin/env bash

# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

patch_file="__patch"

[ -e ${patch_file} ] && svn patch --reverse-diff ${patch_file}
nc -l 8080 > ${patch_file}

svn patch ${patch_file}

mk.sh 1> /dev/null
