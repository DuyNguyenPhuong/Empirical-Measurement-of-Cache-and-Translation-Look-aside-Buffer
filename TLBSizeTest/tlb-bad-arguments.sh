#!/bin/bash

# Compile the program
gcc tlb.c helperTLB.c -o tlb

# Run The test
run_test() {
    echo "Testing with arguments: $@"
    ./tlb "$@"
    status=$?
    if [ $status -ne 1 ]; then
        exit 1
    fi
}

echo "Starting bad argument tests (5 sub-tests)..."

# Run all the test

# Test 1: No arguments
run_test

# Test 2: One argument (should fail)
run_test 1000

# Test 3: More than required arguments (should fail)
run_test 1000 100 10000

# Test 4: Not integers (should fail)
run_test 1000 abc 

# Test 5: Negative integers (should fail)
run_test -1 10 
echo "All bad argument tests passed."