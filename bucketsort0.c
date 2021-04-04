#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include "papi.h"
#define tam_bucket 1000000
#define num_bucket 10
#define max 10
typedef struct
{
    int topo;
    int* balde;
} bucket;
void bucket_sort(int v[], int tam); //cabeçalho das funções
void bubble(int v[], int tam);
void bucket_sort(int v[], int tam)
{
    bucket b[num_bucket];
    int i, j, k;
    for (i = 0; i < num_bucket; i++)
        b[i].balde = malloc(sizeof(int)*tam_bucket);
    
    /* 1 */ for (i = 0; i < num_bucket; i++) //inicializa todos os "topo"
        b[i].topo = 0;
    /* 2 */ for (i = 0; i < tam; i++)
    { //verifica em que balde o elemento deve ficar
        j = (num_bucket)-1;
        //b[v[i]/max].balde[b[v[i]/max].topo++] = v[i];
        while (1)
        {
            if (j < 0)
                break;
            if (v[i] >= j * 10)
            {
                b[j].balde[b[j].topo] = v[i];
                (b[j].topo)++;
                break;
            }
            j--;
        }
    }
    /* 3 */ for (i = 0; i < num_bucket; i++) //ordena os baldes
        if (b[i].topo)
            bubble(b[i].balde, b[i].topo);
    i = 0;
    /* 4 */ for (j = 0; j < num_bucket; j++)
    { //põe os elementos dos baldes de volta no vetor
        for (k = 0; k < b[j].topo; k++)
        {
            v[i] = b[j].balde[k];
            i++;
        }
    }
}
void bubble(int v[], int tam) // 0-9 10-19 20-29
{
    int i, j, temp, flag;
    if (tam)
        for (j = 0; j < tam - 1; j++)
        {
            flag = 0;
            for (i = 0; i < tam - 1; i++)
            {
                if (v[i + 1] < v[i])
                {
                    temp = v[i];
                    v[i] = v[i + 1];
                    v[i + 1] = temp;
                    flag = 1;
                }
            }
            if (!flag)
                break;
        }
}
void print_array(int v[], int N)
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%d ", v[i]);
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

char* is_sorted(int *v,int N){
    int r = 1;
    for(int i = 0; i <N-1;i++){
        if(v[i]>v[i+1]) r = 0;
    }
    return (r)?"Yes":"No";
}

int main()
{
    int N = 1000000;
    int *v;
    v = malloc(sizeof(int) * N);
    random_vector(v, N);
    //printf("Original:\n");
    //print_array(v, N);
    int retval;
    retval = PAPI_hl_region_begin("computation");
    if (retval != PAPI_OK)
    {
        printf("Error Begin\n");
        return 1;
    }
    bucket_sort(v, N);
    retval = PAPI_hl_region_end("computation");
    if (retval != PAPI_OK)
    {
        printf("Error End\n");
        return 1;
    }
    printf("Done!\n");
    printf("Is sorted? %s\n",is_sorted(v,N));
    return 0;
}
