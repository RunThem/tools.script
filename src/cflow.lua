#!/usr/bin/env lua

-- Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
-- All rights reserved. See MIT LICENSE for redistribution.

local call_dot = arg[1]
local ignore_cfg = '/home/chenchaoyuan/.config/ignore.cfg'

local file = io.open(call_dot, 'r')

if not file then
  return
end

function split(str, s)
  local parts = {}
  for part in str:gmatch('([^' .. s .. ']+)') do
    table.insert(parts, part)
  end

  return parts
end

local _ignore = io.open(ignore_cfg, 'r'):read('*a')
local ignore = split(_ignore, ',')

for k, v in ipairs(ignore) do
  ignore[v] = true
end

-- 忽略前两行
print(file:lines()())

print('nodesep=1.5')
print('ranksep=1.5')
print('splines=false')
print('constraint=false')
print('overlap=false')
print('rankdir=LR')

print(file:lines()())

for line in file:lines() do
  local tbl = split(line, ' ')

  if tbl[1] == '}' then
    break
  end

  -- 使用节点
  if tbl[2] == '->' then
    if ignore[tbl[1]] or ignore[tbl[3]] then
      goto continue
    end
  else -- 定义节点
    if ignore[tbl[1]] then
      if tbl[#tbl]:sub(string.len(tbl[#tbl])) ~= ']' then
        file:lines()()
      end

      goto continue
    end
  end

  print(line)

  ::continue::
end

print('}')

file:close()
