#!/bin/bash

# List of test names
test_names=("small-large-array-test" "number-access-test")

# Function to Complier each file
compile() {
    echo "Compiling $1..."
    if ! gcc -o "$1" "$1.c" helperMeasurement.c; then
        echo "Compilation failed for $1"
        exit 1
    fi
}

# Function to Run each file
run_test() {
    test_case="$1"
    printf "Running test: $test_case...\n"
    if ./$test_case; then
        echo -e "\e[32mPassed\e[0m $test_case"
        ((passed_tests++))  # Increment passed tests count
    else
        echo -e "\e[31mFailed\e[0m $test_case"
    fi
}

# Clean up the program
cleanup() {
    for file in "${test_names[@]}"; do
        rm -f "$file"
    done
}
trap cleanup EXIT

# Compile each test file
for test_name in "${test_names[@]}"; do
    compile "$test_name"
done

# Count of passed tests and total test
passed_tests=0
total_tests="${#test_names[@]}"

# Run each test file
for test_name in "${test_names[@]}"; do
    run_test "$test_name"
done

# Number of test passed
echo "Number of passed tests: $passed_tests / $total_tests"


# chmod +x run_all_cache_tests.sh
# ./run_all_cache_tests.sh
