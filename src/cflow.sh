#!/usr/bin/env bash

# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

# -r --main=${func}
flag="--main=perf_handle_1sec"
file="perf.c"
call_dot=".call.dot"
new_call_dot="/home/chenchaoyuan/call.dot"

cflow -f dot ${flag} ${file} > ${call_dot}

# cflow.lua ${call_dot} > ${new_call_dot}

# cat ${new_call_dot} | dot -Tjpg -Gdpi=600 -Gsize=10000,10000 ${new_call_dot} > call.jpg

# rm ${call_dot}

sync
