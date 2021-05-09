import os
import subprocess

os.system('make')
os.system('rm results/*')


size = 1000000
n_buckets = 1000

os.system('perf stat -o results/out_insert_sequential.txt --append ./insertsequential %d' % (size,n_buckets))
os.system('perf stat -o results/out_quick_sequential.txt --append ./quicksequential %d' % (size,n_buckets))
for n_threads in range(2,33,2):
    os.system('perf stat -o results/out_insert_parallel.txt --append ./insertparallel %d %d' % (size,n_buckets ,n_threads))


for n_threads in range(2,33,2):
    os.system('perf stat -o results/out_quick_parallel.txt --append ./quickparallel %d %d' % (size,n_buckets,n_threads))

#for i in range(2,33,2):
#    os.system('perf stat -o results/outinsert2.txt --append ./insertparallel2 %d %d' % (n, i))

