import os
import subprocess

os.system('make')
os.system('rm outinsert.txt')
os.system('rm outquick.txt')
os.system('rm outinsert2.txt')

n = 1000000

for i in range(2,33,2):
    os.system('perf stat -o outinsert.txt --append ./insertparallel %d %d' % (n, i))


for i in range(2,33,2):
    os.system('perf stat -o outquick.txt --append ./quickparallel %d %d' % (n, i))

for i in range(2,33,2):
    os.system('perf stat -o outinsert2.txt --append ./insertparallel2 %d %d' % (n, i))