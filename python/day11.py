import numpy as np 
from sys import maxsize 
from itertools import permutations



universe = []
with open('./lib/puzzle_inputs/day11_test.txt') as f:
    lines = f.readlines()

for line in lines:
    line = line.strip('\n')
    universe.append([*line])
    if '#' not in line:
        universe.append([*line])
universe = np.array(universe)

new_universe = []
col = 0
while col < len(universe[0]):

    
    if '#' not in universe[:,col]:
        universe = np.insert(universe,col,universe[:,col],axis=1).T

    col +=1
unique, counts = np.unique(universe,return_counts=True)
galaxy_num = dict(zip(unique,counts))['#']
galaxy_pairs_num = int(np.math.factorial(galaxy_num) / (np.math.factorial(2) * np.math.factorial(galaxy_num-2)))

for i in range(0,galaxy_num):
    for j in range(0,galaxy_num):
        if i != j:
            
