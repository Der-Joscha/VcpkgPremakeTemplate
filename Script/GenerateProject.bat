@echo off
pushd %~dp0\..

premake5 vs2019 -f premake5.lua

popd
pause