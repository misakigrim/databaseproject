import random

# https://www.tutorialspoint.com/generating-random-number-list-in-python
used = [1, 85, 28, 56, 42, 15, 78, 66, 24, 53, 39, 76, 23, 7, 54, 13, 95, 29, 71, 79, 33, 47, 41, 61,
80, 82, 64, 18, 69, 49, 51, 46, 20, 35, 45, 55, 26, 81, 43, 44, 80, 59, 32, 74, 38, 52, 30, 14, 91, 6, 37,
62, 68, 17, 25, 58, 90, 83, 77, 16, 57, 4, 50, 60, 73, 72, 75, 2, 5  ]
unused = []

for i in range(0,3):
    x = random.randint(1,100)
    if x in used:
        continue
    else:
        unused.append(x)

print(unused)
    


