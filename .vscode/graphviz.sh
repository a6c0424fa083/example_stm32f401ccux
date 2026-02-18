#!/bin/sh

#
#  graphviz.sh
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#

echo NULL > logs/graphviz.log
cmake --build --preset Graphviz 2>&1 | tee logs/graphviz.log
