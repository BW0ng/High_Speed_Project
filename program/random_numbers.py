import random
import sys
import os

num_random = 30;

fileName = "./gdiv"
initial = 0.75
iteration = 6
internal = 19 # num of decimal
actual = 19

global seed 

seed = random.random()

if (len(sys.argv) > 1):
    num_random = int(sys.argv[1])

with open('numbers.txt', 'w') as f:
    
    orig_stdout = sys.stdout
    sys.stdout = f    
    for i in range(num_random):
    
        random.seed(seed)
        first = random.uniform(1, 2)

        random.seed(first)
        second = random.uniform(1, 2)

        seed = second

        string = ("%s %1.15f %1.15f %1.2f %d %d %d") % \
            (fileName, first, second, \
                initial, iteration, internal, actual)
        output = os.popen(string).read()
        
        print(output)
    sys.stdout = orig_stdout
    f.close()
