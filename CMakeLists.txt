cmake_minimum_required(VERSION 3.15)

project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(HelloWorld main.cpp)

# Recommended: add nice compiler warnings
if(MSVC)
  target_compile_options(HelloWorld PRIVATE /W4 /permissive-)
else()
  target_compile_options(HelloWorld PRIVATE -Wall -Wextra -Wpedantic)
endif()
