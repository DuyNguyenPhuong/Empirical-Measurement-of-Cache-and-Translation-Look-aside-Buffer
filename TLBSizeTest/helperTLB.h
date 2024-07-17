#ifndef HELPERTLB_H
#define HELPERTLB_H

#define NUM_TRIALS 100 // Set Number Trial
// #define JUMP 1024                // Amount of element in an array we jump when accessing
#define ONE_BILLION 1000000000LL       // Set one Billion
#define PAGESIZE sysconf(_SC_PAGESIZE) // Usually 4096 bytes

void set_cpu_affinity();
long long calculate_jump_size_to_different_page(long long size);
int malloc_and_no_initialize_array_from_number_of_page(int **array, long long numPage, long long pageSize, long long numElements);
double measure_average_access_time_with_step(int *array, long long numElements, long long jump);
void accessArray(int *array, long long numElements, long long jump);
#endif /* HELPERTLB_H */