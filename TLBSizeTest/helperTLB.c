#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperTLB.h"

// This code is to set CPU Affinity
// This code is reference by https://stackoverflow.com/questions/280909/how-to-set-cpu-affinity-for-a-process-from-c-or-c-in-linux
void set_cpu_affinity()
{
    cpu_set_t mask;
    CPU_ZERO(&mask);
    // Bind process to CPU 0
    CPU_SET(0, &mask);

    // Set CPU affinity
    if (sched_setaffinity(0, sizeof(mask), &mask) == -1)
    {
        perror("sched_setaffinity failed");
        exit(EXIT_FAILURE);
    }
}

/*
Calculate jump so that we jump to different page everytime
*/
long long calculate_jump_size_to_different_page(long long size)
{
    return size / sizeof(int);
}

/*
Malloc the array and initialize each element of the array
with random element to reduce complier optimization

@param:
- array: the array we malloc and intilize
- numPage: number of page
- pageSize: size of a page in bytes

@return:
- If the memory allocation is successful and the array initialization is completed
the function returns 0 (EXIT_SUCCESS).
- Else, the function returns EXIT_FAILURE.
*/
int malloc_and_no_initialize_array_from_number_of_page(int **array, long long numPage, long long pageSize, long long numElements)
{
    // Malloc an array
    *array = (int *)malloc(numPage * pageSize);
    if (!(*array))
    {
        perror("Memory allocation failed");
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

/*
Measure Average Access Time of Each Element in nanosecond

Parameters:
- Array: an given array
- Number of element in the array

Return:
Double time: Average Access Time of Each Element in nanosecond
*/
double measure_average_access_time_with_step(int *array, long long numElements, long long jump)
{
    // Time variable to keep track of time
    struct timespec start, end;

    // Set time variable to 0
    start.tv_nsec = 0;
    end.tv_nsec = 0;
    start.tv_sec = 0;
    end.tv_sec = 0;

    long long totalTime = 0;

    // Start the clock
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int trial = 0; trial < NUM_TRIALS; trial++)
    {
        accessArray(array, numElements, jump);
    }

    // End the clock
    clock_gettime(CLOCK_MONOTONIC, &end);

    totalTime = (end.tv_sec - start.tv_sec) * 1000000000LL + (end.tv_nsec - start.tv_nsec);

    double averageAccessTime = (double)totalTime / (NUM_TRIALS * numElements / jump);

    return averageAccessTime;
}

// Access step to with a step so that we visit a new page each time
// And we increment the elemnet by 1
void accessArray(int *array, long long numElements, long long jump)
{
    for (int i = 0; i < numElements; i += jump)
    {
        array[i] += 1;
    }
}