#!/bin/bash

# Compile the C program
gcc tlb.c -o tlb helperTLB.c

# Check if the compilation is success
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# CSV file's Header
echo "Number Of Page,Number Of Trial,Average Time Access (ns)" > tlb_results.csv

# Test List
declare -a numPagesArray=(1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536)

declare -a numTrialsArray=(100) # List trial numbers

# Run tests for each page and each trials
for numPages in "${numPagesArray[@]}"; do
    for numTrials in "${numTrialsArray[@]}"; do
        echo "Running test for numPages=$numPages numTrials=$numTrials..."
        ./tlb $numPages $numTrials >> tlb_results.csv
    done
done

rm -f tlb

echo "Tests completed. Results saved to results.csv."

# To Run:
# chmod +x run_tlb.sh
# ./run_tlb.sh