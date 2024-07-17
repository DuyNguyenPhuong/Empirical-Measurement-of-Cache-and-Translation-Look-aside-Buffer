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

    // Define number of pages
    long long numPages = 32768;

    // Calculate the jump based on page size
    long long jump = calculate_jump_size_to_different_page(PAGESIZE);

    int *array;

    // calculate number of element in the array
    long long numElementsLarge = numPages * PAGESIZE / sizeof(int);

    if (malloc_and_no_initialize_array_from_number_of_page(&array, numPages, PAGESIZE, numElementsLarge))
    {
        return EXIT_FAILURE;
    }

    // Save first elemnt to check later
    int initialValue = array[0];

    // Measure access times array
    double averageAccessTimeLarge = measure_average_access_time_with_step(array, numElementsLarge, jump);

    // Check if array[0] has been incremented as expected
    if (array[0] != initialValue + NUM_TRIALS)
    {
        printf("Test failed: array[0] was not incremented correctly.\n");
        free(array);
        return EXIT_FAILURE;
    }

    // Clean up
    free(array);

    return EXIT_SUCCESS;
}
