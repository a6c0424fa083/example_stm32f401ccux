#
#  customTargets.cmake
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#

# check for graphviz
find_program(GRAPHVIZ_DOT_EXECUTABLE dot)

# auto-render PNG if Graphviz is available
if(GRAPHVIZ_DOT_EXECUTABLE)
    add_custom_target(graphviz
        COMMAND
            ${CMAKE_COMMAND} --graphviz=${CMAKE_BINARY_DIR}/generated/Graphviz/build/dependencies.dot ${CMAKE_SOURCE_DIR}

        COMMAND
            ${GRAPHVIZ_DOT_EXECUTABLE} -Tpng ${CMAKE_BINARY_DIR}/generated/Graphviz/build/dependencies.dot -o ${CMAKE_BINARY_DIR}/generated/Graphviz/dependencies.png

        COMMENT
            "Generating dependency graph..."

        VERBATIM
    )
endif ()