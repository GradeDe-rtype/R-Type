#!/bin/bash

# Variables
SOURCE_FILE="main.cpp"
OUTPUT_FILE="main.out"

# Compilation du fichier main.cpp
echo "Compiling $SOURCE_FILE..."
g++ -o $OUTPUT_FILE $SOURCE_FILE -I/usr/include -L/usr/lib -lGL -lGLU -lGLEW -lglm 2> compile_errors.log

# Vérification de la compilation
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed. Check compile_errors.log for details."
    cat compile_errors.log
    exit 1
else
    echo "✅ Compilation succeeded."
fi

# Exécution du programme
echo "Running the program..."
./$OUTPUT_FILE > program_output.log

# Vérification de l'exécution
if [ $? -ne 0 ]; then
    echo "❌ Program execution failed. Check program_output.log for details."
    cat program_output.log
    exit 1
else
    echo "✅ Program executed successfully."
    echo "Output:"
    cat program_output.log
fi

exit 0
