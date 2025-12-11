cmake_minimum_required(VERSION 3.15)

project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Create a static library for math operations
add_library(math_operations STATIC math_operations.cpp)
target_include_directories(math_operations PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Executable built from main.cpp
add_executable(test_app main.cpp)
target_link_libraries(test_app PRIVATE math_operations)

# Recommended: add nice compiler warnings
if(MSVC)
  add_compile_options(/W4 /permissive-)
else()
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()


# --- Threads support
find_package(Threads REQUIRED)

# -- Unit tests (Google Test): try find_package, fallback to FetchContent
find_package(GTest QUIET)
if(NOT TARGET GTest::gtest)
  include(FetchContent)
  FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0
  )
  FetchContent_MakeAvailable(googletest)
endif()

enable_testing()
add_executable(unit_tests tests/unit_tests.cpp)
target_link_libraries(unit_tests PRIVATE GTest::gtest_main math_operations Threads::Threads)
target_include_directories(unit_tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
add_test(NAME unit_tests COMMAND unit_tests)

# run_tests target that invokes ctest with config
add_custom_target(run_tests
  COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIG> --output-on-failure
  DEPENDS unit_tests
)

