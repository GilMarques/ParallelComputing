import os
import subprocess
import sys
os.system('make')


if(len(sys.argv)>2):
    size = int(sys.argv[1])
    n_buckets = int(sys.argv[2])
    folder = 'results/s%d_nb%d'%(size, n_buckets)
    os.system('mkdir %s' % (folder))

    os.system('perf stat -o %s/out_insert_sequential.txt --append ./insertsequential %d %d' % (folder,size,n_buckets))
    os.system('perf stat -o %s/out_quick_sequential.txt --append ./quicksequential %d %d' % (folder,size,n_buckets))
    for n_threads in range(2,33,2):
        os.system('perf stat -o %s/out_insert_parallel.txt --append ./insertparallel %d %d %d' % (folder,size,n_buckets ,n_threads))


    for n_threads in range(2,33,2):
        os.system('perf stat -o %s/out_quick_parallel.txt --append ./quickparallel %d %d %d' % (folder,size,n_buckets,n_threads))
else:
    print('No')
#for i in range(2,33,2):
#    os.system('perf stat -o results/outinsert2.txt --append ./insertparallel2 %d %d' % (n, i))

