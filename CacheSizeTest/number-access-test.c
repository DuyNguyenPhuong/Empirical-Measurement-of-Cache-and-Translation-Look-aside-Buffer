#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperMeasurement.h"

// #define NUM_TRIALS 1000 // Set Number Trial
#define TEST_SIZE 1024 * 1024 // Set size to be 1MB

int main()
{
    // Set PCU affinity
    set_cpu_affinity();

    // Dummy integer to print at the end to prevent complier optimization
    int dummy = 0;

    // Set number of element in a array
    long long numElements = calculate_num_elements(TEST_SIZE);

    // Malloc the array and initialize each element of the array
    // with a random number. This will reduce the complier optimization
    int *array;
    if (malloc_and_no_initialize_array(&array, TEST_SIZE, numElements))
        return EXIT_FAILURE;

    // Save the initial value for later test
    int initialValueOfFirstElement = array[0];

    srand(time(NULL));
    // Random Number to Increment in the array
    int randomIncrementNumber = rand();

    // Measure Average Access Time of Each Element in nanosecond
    double averageAccessTime = measure_average_access_time(array, 1, randomIncrementNumber);

    // Random number to access to calculate dummy to reduce complier optimitzation
    int randomAccessNumber = rand();
    dummy += array[0] + array[randomAccessNumber % (numElements)];

    // Check if array[0] is incremented correctly
    if (array[0] != initialValueOfFirstElement + randomIncrementNumber * NUM_TRIALS)
    {
        printf("Test failed: array[0] is not incremented correctly.\n");
        free(array);
        return EXIT_FAILURE;
    }

    // Return Success
    return EXIT_SUCCESS;

    // Free the array
    free(array);
    return 0;
}
