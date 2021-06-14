#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <mpi.h>
#include <omp.h>
#define max 10
typedef struct
{
    int topo;
    int *balde;
} bucket;
void bucket_sort( int);
void quicksort(int *, int , int);
void print_array(int *, int) ;
void random_vector(int *, int) ;
char *is_sorted(int *, int);
int nt;
int tam_bucket;

double start1,start2,start3,start4,sequential, msg,total;

void bucket_sort(int N)
{
    
    int id, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &id);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    
    if (id == 0)
    {
        start1 =  omp_get_wtime();
        int *v = malloc(sizeof(int) * N);
        random_vector(v, N);
        
        bucket *b = malloc(sizeof(bucket) * (nt));
        int i, j, k;
        for (i = 0; i < nt; i++)
        {
            b[i].balde = malloc(sizeof(int) * tam_bucket);
            b[i].topo = 0;
        }


         for (i = 0; i < N; i++)
        {
            int elem = v[i];
            int x = elem / max;
            b[x].balde[b[x].topo++] = elem;
        }

        sequential = omp_get_wtime() - start1;
        start2 = omp_get_wtime();
        for(i= 1;i< nt;i++){
            MPI_Send(&b[i].topo, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
            MPI_Send(b[i].balde, b[i].topo, MPI_INT, i, 0, MPI_COMM_WORLD);
            
        }
        msg = omp_get_wtime()-start2;


        quicksort(b[0].balde,0,b[0].topo-1);

        start3 = omp_get_wtime();
        for(i= 1;i< nt;i++){
            MPI_Recv(b[i].balde, b[i].topo, MPI_INT, i, 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
        }
        msg += omp_get_wtime()- start3;
        start4 = omp_get_wtime();

        i = 0;
        for (j = 0; j < nt; j++)
        {
            for (k = 0; k < b[j].topo; k++)
            {
                v[i] = b[j].balde[k];
                i++;
            }
        }
        sequential += omp_get_wtime()-start4;
        total = omp_get_wtime() - start1; 
        printf("Sequential: %f\n",sequential);
        printf("Message: %f\n",msg);
        printf("Total: %f\n",total);


        //printf("%s\n",is_sorted(v,N));

    }else{
            int qtd;
            
            int *local;
            MPI_Recv(&qtd, 1, MPI_INT, 0, 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
            
            local = malloc(sizeof(int) * qtd);
            MPI_Recv(local, qtd, MPI_INT, 0, 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
            
            quicksort(local,0,qtd-1);
        
            MPI_Send(local, qtd, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
    return;

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
        v[i] = rand() % (max * nt);
    }
   
}

char *is_sorted(int *v, int N)
{
    int r = 1;
    int i;
    for ( i = 0; i < N - 1; i++)
    {
        if (v[i] > v[i + 1])
            r = 0;
    }
    return (r) ? "Yes" : "No";
}

int main(int argc, char *argv[])
{

    int N;
    MPI_Init(&argc, &argv);
    if (argc == 3)
    {
        N = atoi(argv[1]);
        nt = atoi(argv[2]);
        tam_bucket = (N / (nt-1)) * 10;
    }
    else if (argc > 3)
    {
        printf("Too many arguments supplied.\n");
        return 1;
    }
    else
    {
        printf("Three arguments expected.\n");
        return 1;
    }

    bucket_sort(N);
    MPI_Barrier(MPI_COMM_WORLD);   
    
MPI_Finalize();
   

    return 0;
}
