import os
import subprocess
import sys
#os.system('make')

os.system('mkdir results')


size = 5000000
n_buckets = 2
i = 1
k = 1



for n_buckets in range(20,100,2):
        folder = 'results/s%d' % (size)
        os.system('mkdir %s' % (folder))

        for i in range(5):
                os.system('mpirun -np %d ./a.out %d %d >> %s/insert_parallel.txt' % (n_buckets, size, n_buckets,folder))



for n_buckets in range(200,1000,100):
        folder = 'results/s%d' % (size)
        os.system('mkdir %s' % (folder))        
        os.system('./insertsequential %d %d >> %s/insert_sequential.txt' % (size,n_buckets,folder))