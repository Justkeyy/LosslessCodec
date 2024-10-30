cmake_minimum_required(VERSION 3.24)

set(CMAKE_PROJECT_TOP_LEVEL_INCLUDES conan_provider.cmake)
project(CodecProject)

set (CMAKE_CXX_STANDARD 20)
set (CMAKE_CXX_STANDARD_REQUIRED TRUE)

find_package(exiv2 REQUIRED)

add_compile_definitions(NOMINMAX)

add_executable(ConvertRAW ConvertRAW.cpp
    debayerization.h debayerization.cpp
    qoi.h stb_image.h stb_image_write.h
    color_to8bit.h color_to8bit.cpp
    formatwriter.h formatwriter.cpp
    formatreader.h formatreader.cpp
    sepchannels.h sepchannels.cpp
    unitechannels.h unitechannels.cpp
    exifreader.h exifreader.cpp
    Constants.h)
target_link_libraries(ConvertRAW exiv2::exiv2)



