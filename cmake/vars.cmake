#
#  vars.cmake
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#


###############################################
#####   M A I N   T A R G E T   N A M E   #####
###############################################

set(MAIN_TARGET_NAME "firmware")



###########################################
#####   G L O B A L   D E F I N E S   #####
###########################################

# MCU type
set(MCU "STM32F401CCU6" CACHE STRING "")



###############################################
#####   G L O B A L   V A R I A B L E S   #####
###############################################

# cmsis-core
set(CMSIS_CORE_LIB_PATH
    ${CMAKE_SOURCE_DIR}/Drivers/cmsis-core
    
    CACHE INTERNAL
        "cmsis-core base path"
)

# cmsis-device
set(CMSIS_DEV_LIB_PATH
    ${CMAKE_SOURCE_DIR}/Drivers/cmsis-device
    
    CACHE INTERNAL
        "cmsis-device base path"
)

# stm32 hal
set(HAL_LIB_PATH
    ${CMAKE_SOURCE_DIR}/Drivers/hal-driver
    
    CACHE INTERNAL
        "hal base path"
)

set(HAL_LIB_SRC_PATH
    ${HAL_LIB_PATH}/Src/stm32f4xx
    
    CACHE INTERNAL
        "hal src path"
)

set(HAL_LIB_SRC_LEGACY_PATH
    ${HAL_LIB_PATH}/Src/stm32f4xx
    
    CACHE INTERNAL
        "hal src path (legacy)"
)

# segger rtt
set(RTT_LIB_PATH
    ${CMAKE_SOURCE_DIR}/Drivers/RTT
    
    CACHE INTERNAL
        "segger rtt base path"
)
