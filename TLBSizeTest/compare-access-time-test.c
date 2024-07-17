#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperTLB.h"

int main()
{
    // Set CPU affinity to ensure consistent timing
    set_cpu_affinity();

    // Define small and large number of pages
    long long numPagesSmall = 4;
    long long numPagesLarge = 32768;

    // Calculate the jump based on page size
    long long jump = calculate_jump_size_to_different_page(PAGESIZE);

    int *arraySmall, *arrayLarge;

    // calculate number of element in the array
    long long numElementsSmall = numPagesSmall * PAGESIZE / sizeof(int);
    long long numElementsLarge = numPagesLarge * PAGESIZE / sizeof(int);

    // Allocate arrays without initializing (as per your setup)
    if (malloc_and_no_initialize_array_from_number_of_page(&arraySmall, numPagesSmall, PAGESIZE, numElementsSmall))
    {
        return EXIT_FAILURE;
    }

    if (malloc_and_no_initialize_array_from_number_of_page(&arrayLarge, numPagesLarge, PAGESIZE, numElementsLarge))
    {
        // Clean up previously allocated array
        free(arraySmall);
        return EXIT_FAILURE;
    }

    // Measure access times for small and big array
    double averageAccessTimeSmall = measure_average_access_time_with_step(arraySmall, numElementsSmall, jump);
    double averageAccessTimeLarge = measure_average_access_time_with_step(arrayLarge, numElementsLarge, jump);

    // Assert that accessing a larger number of pages should take longer
    if (averageAccessTimeSmall > averageAccessTimeLarge)
    {
        printf("Failed: Access time for small number of pages is greater than for large number of pages\n");
        free(arraySmall);
        free(arrayLarge);
        return EXIT_FAILURE;
    }

    // Clean up
    free(arraySmall);
    free(arrayLarge);

    return EXIT_SUCCESS;
}
