#!/bin/bash

# Cross-platform script to consolidate all PDF files from source directory into a target directory
# Supports both Windows (Git Bash, WSL) and Mac/Linux systems

# Usage:
# ./consolidate_pdfs.sh <source_directory> <target_directory>

# Check for arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
fi

# Define source and target directories
SOURCE_DIR=$1
TARGET_DIR=$2

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Create target directory if it does not exist
mkdir -p "$TARGET_DIR"

# Detect platform and execute appropriate command
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (Git Bash or WSL)
    echo "Running on Windows"
    # Use PowerShell to execute the command if necessary
    find "$SOURCE_DIR" -type f -name "*.pdf" -exec cp {} "$TARGET_DIR" \;
else
    # Mac/Linux
    echo "Running on Mac/Linux"
    # Find and copy PDF files
    find "$SOURCE_DIR" -type f -name "*.pdf" -exec cp {} "$TARGET_DIR" \;
fi

echo "All PDF files have been consolidated into: $TARGET_DIR"
