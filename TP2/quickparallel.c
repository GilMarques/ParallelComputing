#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <omp.h>
#define tam_bucket 100000
#define num_bucket 2000
#define max 10
typedef struct
{
    int topo;
    int *balde;
} bucket;
void bucket_sort(int v[], int tam);
void quicksort(int v[], int p, int r);
int nt;
void bucket_sort(int v[], int tam)
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
        int x = v[i] / max;
        b[x].balde[b[x].topo++] = v[i];
    }
#pragma omp parallel num_threads(nt)
#pragma omp for private(i)
    for (i = 0; i < num_bucket; i++)
    {
        if (b[i].topo > 1)
        {
            quicksort(b[i].balde, 0, b[i].topo - 1);
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

void swap(int *v, int i, int j)
{
    int tmp;
    tmp = v[i];
    v[i] = v[j];
    v[j] = tmp;
}

int partition(int A[], int p, int r)
{
    int x, i, j;
    x = A[r];
    i = p - 1;
    for (j = p; j < r; j++)
        if (A[j] <= x)
        {
            i++;
            swap(A, i, j);
        }
    swap(A, i + 1, r);
    return i + 1;
}

void quicksort(int A[], int p, int r)
{
    if (p < r)
    {
        int q = partition(A, p, r);
#pragma omp task
        {
            quicksort(A, p, q - 1);
        }
#pragma omp task
        {
            quicksort(A, q + 1, r);
        }
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
    if (argc == 3)
    {
        N = atoi(argv[1]);
        nt = atoi(argv[2]);
    }
    else if (argc > 3)
    {
        printf("Too many arguments supplied.\n");
        return 1;
    }
    else
    {
        printf("One argument expected.\n");
        return 1;
    }
    int *v;
    v = malloc(sizeof(int) * N);
    random_vector(v, N);
    //printf("Original:\n");
    //print_array(v, N);
    bucket_sort(v, N);

    printf("Done!\n");
    printf("Is sorted? %s\n", is_sorted(v, N));
    //printf("Sorted:\n");
    //print_array(v, N);
    return 0;
}