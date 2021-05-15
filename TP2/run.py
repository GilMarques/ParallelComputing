import os
import subprocess
import sys
os.system('make')

os.system('mkdir results')


size = 5100000
n_buckets = 2000
n_iter = (10000000/1000000) *(80000/2000)
i = 1
k = 1
while size <= 10000000:
    for n_buckets in list(range(int(size/500) - 1000,int(size/500) ,500)) + list(range(int(size/500),int(size/500) + 1001,500)):
        print(i)
        i = i+1
        folder = 'results/s%d_nb%d' % (size, n_buckets)
        os.system('mkdir %s' % (folder))
        
        """os.system('perf stat -o %s/out_insert_sequential.txt --append ./insertsequential %d %d' %
                      (folder, size, n_buckets))"""
        """os.system('perf stat -o %s/out_quick_sequential.txt --append ./quicksequential %d %d' %
                        (folder, size, n_buckets))"""
        """for n_threads in range(2, 33, 2):
                os.system('perf stat -o %s/out_insert_parallel.txt --append ./insertparallel %d %d %d' %
        """
        for n_threads in range(2, 33, 2):
                os.system('perf stat -o %s/out_insert_parallel3.txt --append ./insertparallel3 %d %d %d %d' %
                        (folder, size, n_buckets, n_threads,0))
        """
        for n_threads in range(2, 33, 2):
                os.system('./insertparallel3 %d %d %d %d >> %s/out_times' %
                        (size, n_buckets, n_threads, 1, folder))"""
        #n_buckets = n_buckets+2000
    #n_buckets = 2000
    size = size + 100000

# for i in range(2,33,2):
#    os.system('perf stat -o results/outinsert2.txt --append ./insertparallel2 %d %d' % (n, i))
