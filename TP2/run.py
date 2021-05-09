import os
import subprocess

os.system('make')
os.system('rm results/*')


n = 1000000

for i in range(2,33,2):
    os.system('perf stat -o results/outinsert.txt --append ./insertparallel %d %d' % (n, i))


for i in range(2,33,2):
    os.system('perf stat -o results/outquick.txt --append ./quickparallel %d %d' % (n, i))

for i in range(2,33,2):
    os.system('perf stat -o results/outinsert2.txt --append ./insertparallel2 %d %d' % (n, i))

    