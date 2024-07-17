#!/bin/bash

# Compile the C program
gcc cache.c -O0 -o cache helperMeasurement.c

# Check if the compilation is success
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# CSV file's Header
echo "Array Size (kB),Average Time Access (ns)" > cache_results.csv

# Run Test
echo "Running test for arraySize with numTrials=100..."
./cache >> cache_results.csv
rm -f cache
echo "Tests completed. Results saved to cache_results.csv."

# To Run:
# chmod +x run_cache.sh
# ./run_cache.sh


# L1 Cache: 0.5 to 1.5 nanoseconds
# L2 Cache: 3 to 10 nanoseconds.
# L3 Cache: 10 to 40 nanoseconds

#objdump -d cache > assembly.s