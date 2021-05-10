#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <omp.h>

#define max 10
typedef struct
{
    int topo;
    int *balde;
} bucket;
void bucket_sort(int *v, int tam);
void insertionSort(int *v, int N);

int nt;
int num_bucket;
int tam_bucket;
void bucket_sort(int *v, int tam)
{
    bucket *b = malloc(sizeof(bucket) * num_bucket);
    int i, j, k;

    for (i = 0; i < num_bucket; i++)
    {
        b[i].balde = malloc(sizeof(int) * tam_bucket);
        b[i].topo = 0;
    }

    for (i = 0; i < tam; i++)
    {
        int elem = v[i];
        int x = elem / max;
        {
            b[x].balde[b[x].topo++] = elem;
        }
    }
#pragma omp parallel num_threads(nt)
#pragma omp for private(i)
    for (i = 0; i < num_bucket; i++)
    {
        if (b[i].topo > 1)
        {
            insertionSort(b[i].balde, b[i].topo);
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

    /*int sum = 0;
    for (j = 0; j < num_bucket; j++){
        sum += b[j].topo;
    }
    printf("%d\n",sum/num_bucket);*/
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
/*
void print_array(int v[], int N)
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%d ", v[i]);
    }
    printf("\n");
}*/

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
    // size n_buckets threads
    if (argc == 4)
    {
        N = atoi(argv[1]);
        num_bucket = atoi(argv[2]);
        nt = atoi(argv[3]);
        tam_bucket = (N/num_bucket) * 10;
    }
    else if (argc > 4)
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
    bucket_sort(v, N);

    //printf("Done!\n");
    printf("Insert Parallel Is sorted? %s\n", is_sorted(v, N));
    //printf("Sorted:\n");
    //print_array(v, N);
    return 0;
}
