import random
import csv
import sys
import os

def randomNum():
	fileName = "./gdiv"
	initial = 0.75
	iteration = 6
	internal = 19 # num of decimal
	actual = 19
	seed = random.random()

	num_random = 30

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


def writeCSV():
	global N, D, RQ, RD, error, numBits, RREM, counter

	counter = 0
	with open('data.csv', 'w') as csvfile:
		fieldNames = ['Number', 'N', 'D', 'RQ', 'RD', 'error', 'numBits', 'RREM']
		writer = csv.DictWriter(csvfile, fieldNames)
		writer.writeheader()

		with open('numbers.txt', 'r') as f:
		    for line in f:
		        list = line.split(" ")

		        counter += 1

		        if list[0] == "N":
		            N = list[2]

		        elif list[0] == "D":
		            D = list[2]

		        elif list[0] == "RQ":
		            RQ = list[2]

		        elif list[0] == "RD":
		            RD = list[2]

		        elif list[0] == "error":
		            error = list[3]

		        elif list[0] == "#bits":
		            numBits = list[2]

		        elif list[0] == "RREM":
		            RREM = list[2]

		        if (counter % 18 == 0):
		            writer.writerow({'Number': (counter/18), 'N': N, 'D': D, 'RQ': RQ, 'RD': RD, 'error': error, 'numBits': numBits, 'RREM': RREM})
randomNum()
writeCSV()
