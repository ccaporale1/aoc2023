from functools import reduce

data = open('day15.txt').read().strip().split(',')

char = lambda i, c: (i+ord(c)) * 17 % 256
hash = lambda s: reduce(char, s, 0)

print(sum(map(hash, data)))


boxes = [dict() for _ in range(256)]

for step in data:
    match step.strip('-').split('='):
        case [l, f]: boxes[hash(l)][l] = int(f)
        case [l]:    boxes[hash(l)].pop(l, 0)

print(sum(i*j*f for i,b in enumerate(boxes, 1)
                for j,f in enumerate(b.values(), 1)))