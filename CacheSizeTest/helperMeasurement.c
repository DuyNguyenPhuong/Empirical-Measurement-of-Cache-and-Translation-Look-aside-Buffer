#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <unistd.h>
#include "helperMeasurement.h"

// Access step to with a step of cache line size
// Because we don't want to access the element in the same cache line
// Then we add a random number to each element
void accessArray(int *array, int numElements, int random_increment)
{
    for (int i = 0; i < numElements; i += JUMP)
    {
        array[i] += random_increment;
    }
}

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
Measure Average Access Time of Each Element in nanosecond

Parameters:
- Array: an given array
- Number of element in the array

Return:
Double time: Average Access Time of Each Element in nanosecond
*/
double measure_average_access_time(int *array, long long numElements, int randomIncrementNumber)
{
    // Time variable to keep track of time
    struct timespec start, end;

    // Set time variable to 0
    start.tv_nsec = 0;
    end.tv_nsec = 0;
    start.tv_sec = 0;
    end.tv_sec = 0;

    // Start the clock
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int trial = 0; trial < NUM_TRIALS; trial++)
    {
        accessArray(array, numElements, randomIncrementNumber);
    }

    // End the clock
    clock_gettime(CLOCK_MONOTONIC, &end);

    // Calculate the elapsed time by nanosecond
    long long elapsedTime = (end.tv_sec - start.tv_sec) * ONE_BILLION + (end.tv_nsec - start.tv_nsec);

    // Calculate the total access time
    long long totalAccessTime = NUM_TRIALS * numElements / JUMP;

    return (double)elapsedTime / totalAccessTime;
}

/*
Calculate number of integers in an array
*/
long long calculate_num_elements(long long size)
{
    return size / sizeof(int);
}

/*
Malloc the array and don't initialize the array
Because we don't want any element save in the cache yet


Parameter:
- array: the array we malloc and intilize
- size: size of the array in bytes
- numElements: Number of elements in an array

Return:
- If the memory allocation is successful and the array initialization is completed
the function returns 0 (EXIT_SUCCESS).
- Else, the function returns EXIT_FAILURE.
*/
int malloc_and_no_initialize_array(int **array, long long size, long long numElements)
{
    // Malloc an array
    *array = (int *)malloc(size);
    if (!(*array))
    {
        perror("Memory allocation failed");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
