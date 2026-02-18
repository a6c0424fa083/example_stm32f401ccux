#
#  CMakeLists.txt
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#

cmake_minimum_required(VERSION 4.0)

cmake_policy(SET CMP0156 NEW) # de-duplicate libraries
cmake_policy(SET CMP0179 NEW) # de-duplicate static libraries
cmake_policy(SET CMP0181 NEW) # set <PROJECT-NAME>_* as normal variables

# set global project (TODO: change the project name)
project(Template
    VERSION
        0.1.0

    LANGUAGES
        C ASM
)

# enable testing for ctest()
enable_testing()

# add global labels
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/vars.cmake)

# add custom targets
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/customTargets.cmake)

# add main target
add_executable(${MAIN_TARGET_NAME})

# generate constants.h
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake_config.h.in
    ${CMAKE_BINARY_DIR}/generated/cmake_config.h
)

# configure main target
add_subdirectory(Core)

# add libraries
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/libs.cmake)

# build project recursively
add_subdirectory(Drivers)

# generate .hex and .bin files

add_custom_command(
    TARGET
        ${MAIN_TARGET_NAME}

    POST_BUILD
        COMMAND ${CMAKE_OBJCOPY}
            -O ihex
            $<TARGET_FILE:${MAIN_TARGET_NAME}>
            $<TARGET_FILE_DIR:${MAIN_TARGET_NAME}>/${MAIN_TARGET_NAME}.hex

        COMMAND ${CMAKE_OBJCOPY}
            -O binary
            $<TARGET_FILE:${MAIN_TARGET_NAME}>
            $<TARGET_FILE_DIR:${MAIN_TARGET_NAME}>/${MAIN_TARGET_NAME}.bin

        COMMENT "Generating HEX and BIN files from ELF"
)
