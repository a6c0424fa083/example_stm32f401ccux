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

## add main include dirs: TODO
#set(MAIN_DIRS
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Inc
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/App
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/Target
#
#    CACHE INTERNAL
#        "the main include directories"
#)
#
## add main sources: TODO
#set(MAIN_SRCS
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/gpio.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/i2c.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/main.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/spi.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/stm32f4xx_hal_msp.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/stm32f4xx_it.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/syscalls.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/sysmem.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/system_stm32f4xx.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Core/Src/usart.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/startup_stm32f401xc.s
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/App/usb_device.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/App/usbd_cdc_if.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/App/usbd_desc.c
#    ${CMAKE_CURRENT_SOURCE_DIR}/Core/USB_DEVICE/Target/usbd_conf.c
#
#    CACHE INTERNAL
#        "the main sources"
#)
