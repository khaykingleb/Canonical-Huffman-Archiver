cmake_minimum_required(VERSION 3.15)
message("Building with CMake version: ${CMAKE_VERSION}")
project(archiver)

add_subdirectory(src)
add_subdirectory(tests)
