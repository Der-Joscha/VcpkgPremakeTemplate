#!/bin/bash

if [ $# -eq 0 ]; then
	backend="gmake2"
else
	backend=$1
fi

echo $backend

premake5 $backend -f premake5.lua
