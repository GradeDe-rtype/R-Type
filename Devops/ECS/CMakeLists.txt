cmake_minimum_required(VERSION 3.15)
project(R-Type)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()

if(EXISTS "${CMAKE_BINARY_DIR}/conan_toolchain.cmake")
    include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
else()
    message(FATAL_ERROR "Conan toolchain file not found. Please run 'conan install' in your build directory.")
endif()

add_executable(${PROJECT_NAME} main.cpp)

find_package(SFML CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE
    glm::glm
    sfml-graphics
    sfml-window
    sfml-system
)

if(EXISTS "${CMAKE_BINARY_DIR}/conan/")
    target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR}/conan/include)
endif()

message(STATUS "Project: ${PROJECT_NAME}")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")
