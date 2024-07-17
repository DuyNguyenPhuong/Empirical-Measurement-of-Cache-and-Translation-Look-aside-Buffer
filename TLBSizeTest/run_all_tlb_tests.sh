#!/bin/bash

# List of test names (we will run the bad-agrument in the back)
test_names=("compare-access-time-test" "access-time-tlb-test")

# Function to compile each file
compile() {
    echo "Compiling $1..."
    if ! gcc -o "$1" "$1.c" helperTLB.c; then
        echo "Compilation failed for $1"
        exit 1
    fi
}

# Function to run each compiled test
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

# Run the bash script test for bad arguments test
run_bash_test() {
    echo "Asking permission for bash file..."
    chmod +x tlb-bad-arguments.sh
    echo "Running bash test: tlb-bad-arguments.sh..."
    if ./tlb-bad-arguments.sh; then
        echo -e "\e[32mPassed\e[0m tlb-bad-arguments.sh"
        ((passed_tests++))
    else
        echo -e "\e[31mFailed\e[0m tlb-bad-arguments.sh"
    fi
}

# Compile each test file
for test_name in "${test_names[@]}"; do
    compile "$test_name"
done

# Initialize passed tests count
passed_tests=0
total_tests=$((${#test_names[@]} + 1))  # Add one for the bash script test

# Run each compiled test file
for test_name in "${test_names[@]}"; do
    run_test "$test_name"
done

# Run the bash script test
run_bash_test

# Results
echo "Number of passed tests: $passed_tests / $total_tests"

# Clean up the program
cleanup() {
    for file in "${test_names[@]}"; do
        rm -f "$file"
    done
}
trap cleanup EXIT

rm -f tlb

# To Run:
# chmod +x run_all_tlb_tests.sh
# ./run_all_tlb_tests.sh