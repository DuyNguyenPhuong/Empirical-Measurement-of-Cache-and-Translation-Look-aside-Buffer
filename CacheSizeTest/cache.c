#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperMeasurement.h"

// This definition is to comparing L1 and L2 Cache
// #define MIN_SIZE 1024      // Start with 1KB
// #define MAX_SIZE 1024 * 64 // End up to 64KB
// #define STEP_SIZE 1024     // Step size if we want to list all size

// This definition is to comparing L2 and L3 Cache
#define MIN_SIZE 1024 * 1024      // Start with 1 MB
#define MAX_SIZE 1024 * 1024 * 50 // End up to 50 MB
#define STEP_SIZE 1024 * 1024     // Step size if we want to list all size

int main()
{
    // Set CPU affinity so that we only run on 1 CPU
    set_cpu_affinity();

    // Dummy integer to print at the end to prevent complier optimization
    int dummy = 0;

    // Go through each size of array from min to max size
    for (long long size = MIN_SIZE; size <= MAX_SIZE; size += STEP_SIZE)
    {
        // Set number of element in a array
        long long numElements = calculate_num_elements(size);

        // Malloc the array and no initilization. I will explain why we
        // don't initialized in the paper
        int *array;
        if (malloc_and_no_initialize_array(&array, size, numElements))
            return EXIT_FAILURE;

        srand(time(NULL));
        // Random Number to Increment in the array
        int randomIncrementNumber = rand();

        // Measure Average Access Time of Each Element in nanosecond
        double averageAccessTime = measure_average_access_time(array, numElements, randomIncrementNumber);

        // Random number to access to calculate dummy to reduce complier optimitzation
        int randomAccessNumber = rand();
        dummy += array[0] + array[randomAccessNumber % (numElements)];

        // Print the result to CSV file using a bash script
        printf("%.2f,%.2f\n", (double)size / 1024, averageAccessTime);

        free(array);
    }

    printf("Dummy output to prevent complier optimization: %d\n", dummy);

    return 0;
}