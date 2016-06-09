# gpio-cfg

## Newer project
This project is abandonware
I've recycled the C++ code and added some python wrapper to make it easier to install and maintain the project.
New version is at https://github.com/Ivan-SB/stm32fgpiocfg

## Overview
This program read pin definitions from an STCubeMX project and write C code to set up quickly STM32F1xx GPIO.
The generated code setup and apply all the configuration in as fewer step as possible inspite of looping over every pin.
Configuration is defined gpio-cfg.h in a vector of struct that contain:
- a function name
- a port group (GPIOA, GPIOB...)
- if pull up|down setup should be grouped at the end of port setup or applied ASAP
- if all input ports should be configured before output ports
- a vector of GPIO_InitTypeDef to define port setup

##HOWTO
1. this program comes with a shell file that should help you build the C program that will run and write the C code
2. change gpio-cfg.h to your needs
3. compile gpio-cfg.c (look at m shell script if you need to pass include dir and define manually)
4. run gpio-cfg <include path> <source path>

it will generate a GPIO.c and GPIO.h files

##Whath's wrong with this
I did want to avoid to rewrite pin configuration definition, I didn't want to invent a new syntax to define GPIO setup other than the GPIO_InitTypeDef defined in ST Cube library.
I didn't want to write a C parser to read mxconstants.h and stm32f1xx_hal_gpio.h and to parse a C struct.
So you'll have to compile this everytime you want a new pin configuration.

