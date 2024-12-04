cmake_minimum_required(VERSION 3.15)
project(R-Type)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type (Debug or Release)" FORCE)
endif()

if(EXISTS "${CMAKE_BINARY_DIR}/conan/conan_toolchain.cmake")
    include(${CMAKE_BINARY_DIR}/conan/conan_toolchain.cmake)
else()
    message(FATAL_ERROR "Conan toolchain file not found. Run 'conan install' with '--output-folder'.")
endif()

# Forcer l'utilisation de Visual Studio sur Windows
if(WIN32)
    set(CMAKE_C_COMPILER "cl")
    set(CMAKE_CXX_COMPILER "cl")
endif()

add_executable(${PROJECT_NAME} main.cpp)

find_package(SFML CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(Boost REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE
    glm::glm
    sfml-system
    sfml-window
    sfml-graphics
    Boost::headers
)

if(EXISTS "${CMAKE_BINARY_DIR}/conan/include")
    target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR}/conan/include)
endif()

message(STATUS "Project: ${PROJECT_NAME}")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")
