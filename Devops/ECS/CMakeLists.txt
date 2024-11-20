cmake_minimum_required(VERSION 3.15)
project(R-Type)

# Vérifier que CMAKE_BUILD_TYPE est défini
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

add_executable(${PROJECT_NAME} main.cpp)

find_package(SFML CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE glm::glm sfml-graphics sfml-window sfml-system)
