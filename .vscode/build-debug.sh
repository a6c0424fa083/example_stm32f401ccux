#!/bin/sh

#
#  build-debug.sh
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#

echo NULL > logs/build-debug-cmake.log
echo NULL > logs/build-debug-make.log
cmake --preset Debug 2>&1 | tee logs/build-debug-cmake.log
cmake --build --preset Debug 2>&1 | tee logs/build-debug-make.log
