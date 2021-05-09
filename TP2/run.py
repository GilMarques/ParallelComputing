import os
import subprocess

os.system('make')
os.system('rm out.txt')
os.system('touch out.txt')
n = 1000000

for i in range(2,33,2):
    os.system('perf stat -o out.txt --append ./insertparallel %d %d' % (n, i))