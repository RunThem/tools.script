#!/usr/bin/env bash

# Copyright (c) 2023 RunThem <iccy.fun@outlook.com>
# All rights reserved. See MIT LICENSE for redistribution.

sync_branch="workspace_sync"
master_branch="master"

LANG=us

# 同步远程仓库信息
git fetch

# 查看是否存在 ${workspace_sync} 远程分支
git branch -r | grep ${sync_branch} >/dev/null 2>&1
if [ ${?} -eq 1 ]; then
  git stash push
  git checkout -b ${sync_branch}

  git push origin ${sync_branch}

  git checkout ${master_branch}
  git branch -D ${sync_branch}
  git stash pop
fi

if [ "${1}" == "push" ]; then
  git checkout -b ${sync_branch}
  git add .
  git commit -m "sync: `date`"
  git push -f origin ${sync_branch}:${sync_branch}
  git checkout ${master_branch}
  git branch -D ${sync_branch}
elif [ "${1}" == "pull" ]; then
  git checkout -b ${sync_branch}
  git pull origin ${sync_branch}:${sync_branch}
  git checkout ${master_branch}
  git merge ${sync_branch}
  git reset HEAD^
  git branch -D ${sync_branch}
fi
