#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <omp.h>

#define max 10
typedef struct
{
    omp_lock_t lock;
    int topo;
    int *balde;
} bucket;
void bucket_sort(int *v, int tam);
void bucket_sort_io(int *v, int tam);
void insertionSort(int *v, int N);
void print_array(int *v, int N);
int num_bucket;
int nt;
int tam_bucket;

void bucket_sort_io(int *v, int tam)
{
    bucket *b = malloc(sizeof(bucket) * num_bucket);
    int i, j, k;
    double start, end;

    start = omp_get_wtime();

    for (i = 0; i < num_bucket; i++)
    {
        omp_init_lock(&(b[i].lock));
        b[i].balde = malloc(sizeof(int) * tam_bucket);
        b[i].topo = 0;
    }

    end = omp_get_wtime();
    printf("Time init: %lf\n", end - start);

#pragma omp parallel num_threads(nt)
    {

#pragma omp master
        {
            start = omp_get_wtime();
        }
#pragma omp for
        for (i = 0; i < tam; i++)
        {
            int elem = v[i];
            int x = elem / max;
            omp_set_lock(&(b[x].lock));
            b[x].balde[b[x].topo++] = elem;
            omp_unset_lock(&(b[x].lock));
        }
#pragma omp master
        {
            end = omp_get_wtime();
            printf("Time dist: %lf\n", end - start);
        }

#pragma omp master
        {
            start = omp_get_wtime();
        }
#pragma omp for
        for (i = 0; i < num_bucket; i++)
        {
            if (b[i].topo > 1)
            {
                insertionSort(b[i].balde, b[i].topo);
            }
        }
#pragma omp master
        {
            end = omp_get_wtime();
            printf("Time sort: %lf\n", end - start);
        }
    }
    start = omp_get_wtime();
    i = 0;

    for (j = 0; j < num_bucket; j++)
    {
        for (k = 0; k < b[j].topo; k++)
        {
            v[i] = b[j].balde[k];
            i++;
        }
    }
    end = omp_get_wtime();
    printf("Time copy: %lf\n", end - start);
}

void bucket_sort(int *v, int tam)
{
    bucket *b = malloc(sizeof(bucket) * num_bucket);
    int i, j, k;

    for (i = 0; i < num_bucket; i++)
    {
        omp_init_lock(&(b[i].lock));
        b[i].balde = malloc(sizeof(int) * tam_bucket);
        b[i].topo = 0;
    }

#pragma omp parallel num_threads(nt)
    {

        #pragma omp for
        for (i = 0; i < tam; i++)
        {
            int elem = v[i];
            int x = elem / max;
            omp_set_lock(&(b[x].lock));
            b[x].balde[b[x].topo++] = elem;
            omp_unset_lock(&(b[x].lock));
        }

        #pragma omp for
        for (i = 0; i < num_bucket; i++)
        {
            if (b[i].topo > 1)
            {
                insertionSort(b[i].balde, b[i].topo);
            }
        }
    }

    i = 0;

    for (j = 0; j < num_bucket; j++)
    {
        for (k = 0; k < b[j].topo; k++)
        {
            v[i] = b[j].balde[k];
            i++;
        }
    }
}

void insertionSort(int *arr, int n)
{
    int i, key, j;
    for (i = 1; i < n; i++)
    {
        key = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

void print_array(int v[], int N)
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%d ", v[i]);
    }
    printf("\n");
}

void random_vector(int *v, int N)
{
    int i;
    for (i = 0; i < N; i++)
    {
        v[i] = rand() % (max * num_bucket);
    }
}

char *is_sorted(int *v, int N)
{
    int r = 1;
    for (int i = 0; i < N - 1; i++)
    {
        if (v[i] > v[i + 1])
            r = 0;
    }
    return (r) ? "Yes" : "No";
}

int main(int argc, char const *argv[])
{

    int N;
    int io;
    if (argc == 5)
    {
        N = atoi(argv[1]);
        num_bucket = atoi(argv[2]);
        nt = atoi(argv[3]);
        tam_bucket = (N / num_bucket) * 10;
        io = atoi(argv[4]);
    }
    else if (argc > 5)
    {
        printf("Too many arguments supplied.\n");
        return 1;
    }
    else
    {
        printf("Three arguments expected.\n");
        return 1;
    }
    int *v;
    v = malloc(sizeof(int) * N);
    random_vector(v, N);
    //printf("Original:\n");
    //print_array(v, N);
    if (io)
    {
        bucket_sort_io(v, N);
    }
    else
    {
        bucket_sort(v, N);
    }

    //printf("Done Insert Parallel2!\n");
    //printf("Is sorted? %s\n", is_sorted(v, N));
    //printf("Sorted:\n");
    //print_array(v, N);
    return 0;
}
