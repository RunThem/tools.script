#!/usr/bin/env bash

# Copyright (c) 2022 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

if [ ${#} -eq 1 ]; then
  curl -s "http://fanyi.youdao.com/translate?&doctype=json&type=AUTO&i=${1}" | jq .translateResult[0][0].tgt
fi
