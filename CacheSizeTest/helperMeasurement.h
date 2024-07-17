#ifndef HELPERMEASUREMENT_H
#define HELPERMEASUREMENT_H

#define NUM_TRIALS 1000          // Set Number Trial
#define JUMP 1024                // Amount of element in an array we jump when accessing
#define ONE_BILLION 1000000000LL // Set one Billion

void accessArray(int *array, int numElements, int random_increment);
void set_cpu_affinity();
double measure_average_access_time(int *array, long long numElements, int randomIncrementNumber);
long long calculate_num_elements(long long size);
int malloc_and_no_initialize_array(int **array, long long size, long long numElements);

#endif /* HELPERMEASUREMENT_H */