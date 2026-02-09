#
#  CMakeLists.txt
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#

cmake_minimum_required(VERSION 4.0)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

cmake_policy(SET CMP0156 NEW)
cmake_policy(SET CMP0179 NEW)
cmake_policy(SET CMP0181 NEW)

# set global project (TODO: change the project name)
project(Template
    VERSION 0.1.0
    LANGUAGES C ASM
)

# add global labels
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/vars.cmake)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/customTargets.cmake)

# build project recursively
add_subdirectory(Drivers)

# generate constants.h
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake_config.h.in
    ${CMAKE_BINARY_DIR}/generated/cmake_config.h
)

# add main target
add_executable(${MAIN_TARGET_NAME} ${MAIN_SRCS})

# add libraries
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/libs.cmake)

# add include directories
target_include_directories(${MAIN_TARGET_NAME} PUBLIC
    ${MAIN_DIRS}
    ${CMAKE_BINARY_DIR}/generated
)

# generate .hex and .bin files
find_program(CMAKE_OBJCOPY arm-none-eabi-objcopy)

add_custom_command(
    TARGET ${MAIN_TARGET_NAME}
    POST_BUILD

    COMMAND ${CMAKE_OBJCOPY}
        -O ihex
        $<TARGET_FILE:${MAIN_TARGET_NAME}>
        $<TARGET_FILE_DIR:${MAIN_TARGET_NAME}>/${MAIN_TARGET_NAME}.hex

    COMMAND ${CMAKE_OBJCOPY}
        -O binary
        $<TARGET_FILE:${MAIN_TARGET_NAME}>
        $<TARGET_FILE_DIR:${MAIN_TARGET_NAME}>/${MAIN_TARGET_NAME}.bin

    COMMENT "Generating HEX and BIN from ELF"
)
