#!/usr/bin/env bash

# Copyright (c) 2020 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

IFS='
'

time=$(date +%N)
buf=$(tokei --sort code .)

printf "Tokei T(%.2fs)\n" $(echo "($(date +%N) - ${time}) * 0.000000001" | bc)

for line in ${buf}; do
  echo ${line::53}
done

#!/usr/bin/env bash

# IFS=$'\n'; start_time=$(date +%N); buf=$(tokei --sort code .); printf "Tokei T(%.2fs)\n" $(echo "($(date +%N)-${start_time})*0.000000001" | bc); for line in ${buf}; do echo "${line::53}"; done
