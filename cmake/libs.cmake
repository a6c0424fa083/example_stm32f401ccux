#
#  libs.cmake
#  <Template>
#
#
#  Created by Jannis Sauer on 2026-02-05.
#


###################################
#####   C M S I S   C O R E   #####
###################################

set(CMSIS_CORE_LIB_PATH ${CMAKE_SOURCE_DIR}/Drivers/cmsis-core)

set(CMSIS_CORE_LIB_DIRS
    ${CMSIS_CORE_LIB_PATH}/Core/Include
    ${CMSIS_CORE_LIB_PATH}/Core_A/Include
    ${CMSIS_CORE_LIB_PATH}/Include

    CACHE INTERNAL
        "cmsis-core include dirs"
)
set(CMSIS_CORE_LIB_DEFS
    "" # TODO: add definitions if necessary

    CACHE INTERNAL
        "cmsis-core compile defs"
)

add_library(CMSIS_CORE_LIB
    INTERFACE
)
target_include_directories(CMSIS_CORE_LIB
    INTERFACE
        ${CMSIS_CORE_LIB_DIRS}
)
target_compile_definitions(CMSIS_CORE_LIB
    INTERFACE
        ${CMSIS_CORE_LIB_DEFS}
)



#######################################
#####   C M S I S   D E V I C E   #####
#######################################

set(CMSIS_DEV_LIB_DIRS
    ${CMSIS_DEV_LIB_PATH}/Include

    CACHE INTERNAL
        "cmsis include dirs"
)
set(CMSIS_DEV_LIB_DEFS
    "USE_HAL_DRIVER"
    "STM32F401xC"
    
    CACHE INTERNAL
        "cmsis-device compile defs"
)

add_library(CMSIS_DEV_LIB
    INTERFACE
)
target_include_directories(CMSIS_DEV_LIB
    INTERFACE
        ${CMSIS_DEV_LIB_DIRS}
)
target_compile_definitions(CMSIS_DEV_LIB
    INTERFACE
        ${CMSIS_DEV_LIB_DEFS}
)
target_link_libraries(CMSIS_DEV_LIB
    INTERFACE
        CMSIS_CORE_LIB
)



#################################
#####   S T M 3 2   H A L   #####
#################################

set(HAL_LIB_SRCS
    ${HAL_LIB_SRC_LEGACY_PATH}_hal_can.c
    ${HAL_LIB_SRC_LEGACY_PATH}_hal_eth.c
    ${HAL_LIB_SRC_PATH}_hal.c
    ${HAL_LIB_SRC_PATH}_hal_adc.c
    ${HAL_LIB_SRC_PATH}_hal_adc_ex.c
    ${HAL_LIB_SRC_PATH}_hal_can.c
    ${HAL_LIB_SRC_PATH}_hal_cec.c
    ${HAL_LIB_SRC_PATH}_hal_cortex.c
    ${HAL_LIB_SRC_PATH}_hal_crc.c
    ${HAL_LIB_SRC_PATH}_hal_cryp.c
    ${HAL_LIB_SRC_PATH}_hal_cryp_ex.c
    ${HAL_LIB_SRC_PATH}_hal_dac.c
    ${HAL_LIB_SRC_PATH}_hal_dac_ex.c
    ${HAL_LIB_SRC_PATH}_hal_dcmi.c
    ${HAL_LIB_SRC_PATH}_hal_dcmi_ex.c
    ${HAL_LIB_SRC_PATH}_hal_dfsdm.c
    ${HAL_LIB_SRC_PATH}_hal_dma.c
    ${HAL_LIB_SRC_PATH}_hal_dma2d.c
    ${HAL_LIB_SRC_PATH}_hal_dma_ex.c
    ${HAL_LIB_SRC_PATH}_hal_dsi.c
    ${HAL_LIB_SRC_PATH}_hal_eth.c
    ${HAL_LIB_SRC_PATH}_hal_exti.c
    ${HAL_LIB_SRC_PATH}_hal_flash.c
    ${HAL_LIB_SRC_PATH}_hal_flash_ex.c
    ${HAL_LIB_SRC_PATH}_hal_flash_ramfunc.c
    ${HAL_LIB_SRC_PATH}_hal_fmpi2c.c
    ${HAL_LIB_SRC_PATH}_hal_fmpi2c_ex.c
    ${HAL_LIB_SRC_PATH}_hal_fmpsmbus.c
    ${HAL_LIB_SRC_PATH}_hal_fmpsmbus_ex.c
    ${HAL_LIB_SRC_PATH}_hal_gpio.c
    ${HAL_LIB_SRC_PATH}_hal_hash.c
    ${HAL_LIB_SRC_PATH}_hal_hash_ex.c
    ${HAL_LIB_SRC_PATH}_hal_hcd.c
    ${HAL_LIB_SRC_PATH}_hal_i2c.c
    ${HAL_LIB_SRC_PATH}_hal_i2c_ex.c
    ${HAL_LIB_SRC_PATH}_hal_i2s.c
    ${HAL_LIB_SRC_PATH}_hal_i2s_ex.c
    ${HAL_LIB_SRC_PATH}_hal_irda.c
    ${HAL_LIB_SRC_PATH}_hal_iwdg.c
    ${HAL_LIB_SRC_PATH}_hal_lptim.c
    ${HAL_LIB_SRC_PATH}_hal_ltdc.c
    ${HAL_LIB_SRC_PATH}_hal_ltdc_ex.c
    ${HAL_LIB_SRC_PATH}_hal_mmc.c
#    ${HAL_LIB_SRC_PATH}_hal_msp_template.c
    ${HAL_LIB_SRC_PATH}_hal_nand.c
    ${HAL_LIB_SRC_PATH}_hal_nor.c
    ${HAL_LIB_SRC_PATH}_hal_pccard.c
    ${HAL_LIB_SRC_PATH}_hal_pcd.c
    ${HAL_LIB_SRC_PATH}_hal_pcd_ex.c
    ${HAL_LIB_SRC_PATH}_hal_pwr.c
    ${HAL_LIB_SRC_PATH}_hal_pwr_ex.c
    ${HAL_LIB_SRC_PATH}_hal_qspi.c
    ${HAL_LIB_SRC_PATH}_hal_rcc.c
    ${HAL_LIB_SRC_PATH}_hal_rcc_ex.c
    ${HAL_LIB_SRC_PATH}_hal_rng.c
    ${HAL_LIB_SRC_PATH}_hal_rtc.c
    ${HAL_LIB_SRC_PATH}_hal_rtc_ex.c
    ${HAL_LIB_SRC_PATH}_hal_sai.c
    ${HAL_LIB_SRC_PATH}_hal_sai_ex.c
    ${HAL_LIB_SRC_PATH}_hal_sd.c
    ${HAL_LIB_SRC_PATH}_hal_sdram.c
    ${HAL_LIB_SRC_PATH}_hal_smartcard.c
    ${HAL_LIB_SRC_PATH}_hal_smbus.c
    ${HAL_LIB_SRC_PATH}_hal_spdifrx.c
    ${HAL_LIB_SRC_PATH}_hal_spi.c
    ${HAL_LIB_SRC_PATH}_hal_sram.c
    ${HAL_LIB_SRC_PATH}_hal_tim.c
    ${HAL_LIB_SRC_PATH}_hal_tim_ex.c
#    ${HAL_LIB_SRC_PATH}_hal_timebase_rtc_alarm_template.c
#    ${HAL_LIB_SRC_PATH}_hal_timebase_rtc_wakeup_template.c
#    ${HAL_LIB_SRC_PATH}_hal_timebase_tim_template.c
    ${HAL_LIB_SRC_PATH}_hal_uart.c
    ${HAL_LIB_SRC_PATH}_hal_usart.c
    ${HAL_LIB_SRC_PATH}_hal_wwdg.c
    ${HAL_LIB_SRC_PATH}_ll_adc.c
    ${HAL_LIB_SRC_PATH}_ll_crc.c
    ${HAL_LIB_SRC_PATH}_ll_dac.c
    ${HAL_LIB_SRC_PATH}_ll_dma.c
    ${HAL_LIB_SRC_PATH}_ll_dma2d.c
    ${HAL_LIB_SRC_PATH}_ll_exti.c
    ${HAL_LIB_SRC_PATH}_ll_fmc.c
    ${HAL_LIB_SRC_PATH}_ll_fmpi2c.c
    ${HAL_LIB_SRC_PATH}_ll_fsmc.c
    ${HAL_LIB_SRC_PATH}_ll_gpio.c
    ${HAL_LIB_SRC_PATH}_ll_i2c.c
    ${HAL_LIB_SRC_PATH}_ll_lptim.c
    ${HAL_LIB_SRC_PATH}_ll_pwr.c
    ${HAL_LIB_SRC_PATH}_ll_rcc.c
    ${HAL_LIB_SRC_PATH}_ll_rng.c
    ${HAL_LIB_SRC_PATH}_ll_rtc.c
    ${HAL_LIB_SRC_PATH}_ll_sdmmc.c
    ${HAL_LIB_SRC_PATH}_ll_spi.c
    ${HAL_LIB_SRC_PATH}_ll_tim.c
    ${HAL_LIB_SRC_PATH}_ll_usart.c
    ${HAL_LIB_SRC_PATH}_ll_usb.c
    ${HAL_LIB_SRC_PATH}_ll_utils.c

    CACHE INTERNAL
        "HAL sources"
)
set(HAL_LIB_DIRS
    ${HAL_LIB_PATH}/Inc/Legacy
    ${HAL_LIB_PATH}/Inc
    ${CMAKE_SOURCE_DIR} # necssary for stm32_assert.h
    ${MAIN_DIRS} # necessary for stm32XXxx_hal_conf.h
    
    CACHE INTERNAL
        "HAL include directories"
)

add_library(HAL_LIB
    STATIC
)
target_sources(HAL_LIB
    PRIVATE
        ${HAL_LIB_SRCS}
)
target_include_directories(HAL_LIB
    PUBLIC
        ${HAL_LIB_DIRS}
#        ${MAIN_DIRS}
)
target_compile_definitions(HAL_LIB
    PUBLIC
        "USE_FULL_LL_DRIVER"
)
target_link_libraries(HAL_LIB
    PUBLIC
        CMSIS_DEV_LIB # this library brings the defines (USE_HAL_DRIVER, STM32F401xC) with it
)
