#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperMeasurement.h"

#define NUM_TRIALS 1000 // Define the number of trials for measurement

int main()
{
    // Set PCU affinity
    set_cpu_affinity();

    int *smallArray, *largeArray;
    long long smallSize = 16 * 1024;        // 8KB
    long long largeSize = 1024 * 1024 * 64; // 64MB

    // Calculate num element in each array
    long long numElementsSmall = calculate_num_elements(smallSize);
    long long numElementsLarge = calculate_num_elements(largeSize);

    // Allocate memory for the arrays without initializing them
    if (malloc_and_no_initialize_array(&smallArray, smallSize, numElementsSmall) != EXIT_SUCCESS)
    {
        return EXIT_FAILURE;
    }

    if (malloc_and_no_initialize_array(&largeArray, largeSize, numElementsLarge) != EXIT_SUCCESS)
    {
        // Clean the first on
        free(smallArray);
        return EXIT_FAILURE;
    }

    // Random number to increment to reduce the chance of compiler optimization
    srand(time(NULL));
    int randomIncrement = rand();

    // Measure average access times
    double averageAccessTimeSmall = measure_average_access_time(smallArray, numElementsSmall, randomIncrement);
    double averageAccessTimeLarge = measure_average_access_time(largeArray, numElementsLarge, randomIncrement);

    printf("Average Access Time - Small Array: %f ns\n", averageAccessTimeSmall);
    printf("Average Access Time - Large Array: %f ns\n", averageAccessTimeLarge);

    // It's expected that the larger array might have a larger access time due to more cache misses
    if (averageAccessTimeSmall > averageAccessTimeLarge)
    {
        printf("Error: Access time for the small array is more than the large array.\n");
        return EXIT_FAILURE;
    }

    // Return success
    return EXIT_SUCCESS;

    // Clean up
    free(smallArray);
    free(largeArray);

    return 0;
}
