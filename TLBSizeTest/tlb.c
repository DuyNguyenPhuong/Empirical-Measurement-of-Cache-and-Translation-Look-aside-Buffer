#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include "helperTLB.h"

#define PAGESIZE sysconf(_SC_PAGESIZE) // Page Size is 4096

int main(int argc, char *argv[])
{
    // Check the input
    if (argc != 3)
    {
        return EXIT_FAILURE;
    }

    // Parse argument to values
    char *endptr;
    long long numPages = strtoll(argv[1], &endptr, 10);
    // Check for non-numeric input and ensure positive value
    if (*endptr != '\0' || numPages <= 0)
    {
        return EXIT_FAILURE;
    }

    long long numTrials = strtoll(argv[2], &endptr, 10);
    // Check for non-numeric input and ensure positive value
    if (*endptr != '\0' || numTrials <= 0)
    {
        return EXIT_FAILURE;
    }

    // Set CPU affinity so that we only run on 1 CPU
    set_cpu_affinity();

    // Parse argument to values
    // long long numPages = atoi(argv[1]);
    // long long numTrials = atoi(argv[2]);

    // Calculate jump so that we jump to different page everytime
    // long long jump = PAGESIZE / sizeof(int);
    long long jump = calculate_jump_size_to_different_page(PAGESIZE);

    long long sizeInByte = numPages * PAGESIZE;
    long long numElements = sizeInByte / sizeof(int);

    // Malloc the array. And we won't initilize the array, detailed in the paper
    int *array;
    if (malloc_and_no_initialize_array_from_number_of_page(&array, numPages, PAGESIZE, numElements))
        return EXIT_FAILURE;

    double averageAccessTime = measure_average_access_time_with_step(array, numElements, jump);

    printf("%lld,%lld,%.2f\n", numPages, numTrials, averageAccessTime);

    // Dummy integer to print at the end to prevent complier optimization
    // Use a[0] to make sure the compiler doesn't optimize away the loop
    int dummny = array[0] + 1;

    free(array);
    return EXIT_SUCCESS;
}
