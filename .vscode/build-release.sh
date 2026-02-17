#!/bin/sh

#
#  build-release.sh
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#


echo NULL > logs/build-release-cmake.log
echo NULL > logs/build-release-make.log
cmake --preset Release 2>&1 | tee logs/build-release-cmake.log
ninja --build --preset Release 2>&1 | tee logs/build-release-make.log
