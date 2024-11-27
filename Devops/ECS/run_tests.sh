#!/bin/bash

BUILD_DIR="/ECS/build"
EXECUTABLE="./R-Type"

if [ ! -d "$BUILD_DIR" ]; then
    mkdir -p "$BUILD_DIR"
fi

cd "$BUILD_DIR"

echo "Running CMake configuration..."
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
if [ $? -ne 0 ]; then
    echo "❌ CMake configuration failed."
    exit 1
fi

echo "Building the project..."
make
if [ $? -ne 0 ]; then
    echo "❌ Build failed."
    exit 1
fi

if [ ! -f "$EXECUTABLE" ]; then
    echo "❌ Executable not found: $EXECUTABLE"
    exit 1
fi

echo "Running the program..."
$EXECUTABLE > program_output.log
if [ $? -ne 0 ]; then
    echo "❌ Program execution failed."
    cat program_output.log
    exit 1
fi

echo "✅ Program executed successfully."
echo "Output:"
cat program_output.log

exit 0
