#!/bin/bash
#
# Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.
#
# hp.sh up  ${file} ${ip}
# hp.sh run ${file}
# hp.sh all ${file} ${ip}

# argc=${#}
# argv=(${@})

set -x

net="2"
exe="maincode.bin"
path="/mnt/app"
sip="1.1.1.1"
lip="1.1.1.2"
gdb="gdb"
out=${path}

[ ${#} -ge 2 ] && out="" && exe=${2}
[ ${#} -ge 3 ] && sip=${3}

up() {
  cd /tmp/

  [ "${lip}" != "" ] && ifconfig eth${net} ${lip}
  [ -e ${exe} ] && rm ${exe}

  tftp -gr ${exe} ${sip} -b 50000
  [ ${?} -ne 0 ] && echo "tftp error" && exit

  chmod +x ${exe}
  mv ${exe} ${out}/${exe}
}

run() {
  [ -e "${path}/gdb" ] && gdb=${path}/gdb

  cd ${path}
  ulimit -c unlimited

  ${gdb} -q -ex "set pagination off" -ex "set print pretty on" -ex "run" ${out}/${exe}
}

if [ "${1}" == "up" ]; then
  up
elif [ "${1}" == "run" ]; then
  run
elif [ ${#} -eq 0 ] || [ "${1}" == "all" ]; then
  up
  run
fi
