#!/usr/bin/env bash

# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

flag=""
func=${1}

if [ "${1}" == "-r" ]; then
  flag="-r"
  func=${2}
fi

echo "cflow -f dot ${flag} -m --main=${func} *.c > ~/.cache/call.dot"

cflow -f dot ${flag} -m --main=${func} *.c > ~/.cache/call.dot

echo "cflow.lua ~/.cache/call.dot > ~/call.dot"

cflow.lua ~/.cache/call.dot > ~/call.dot

sync
