#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h> 
#include <omp.h>
#define max 10
typedef struct
{
    int topo;
    int *balde;
} bucket;
void bucket_sort(int *v, int tam);
void quicksort(int *, int ,int);
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
        b[x].balde[b[x].topo++] = elem;
    }

    for (i = 0; i < num_bucket; i++)
    {
        if (b[i].topo > 1)
        {
            quicksort(b[i].balde, 0,b[i].topo-1);
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
        quicksort(A, p, q - 1);
        quicksort(A, q + 1, r);
    }
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
        num_bucket = atoi(argv[2]);
        tam_bucket = (N / num_bucket) * 10;
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
    double start,end;
    start = omp_get_wtime();
    int *v;
    v = malloc(sizeof(int) * N);
    random_vector(v, N);
    bucket_sort(v, N);

    end = omp_get_wtime();

    printf("Total: %f\n", (end - start));
    return 0;
}
