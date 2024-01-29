#!/usr/bin/env lua

-- Copyright (c) 2024 RunThem <iccy.fun@outlook.com>
-- All rights reserved. See MIT LICENSE for redistribution.

local sh = os.execute

local cmd = function(input)
  return io.popen(input):read('*a')
end

print(cmd('echo cmd'))
print(sh('echo sh'))

-- print("hello")
