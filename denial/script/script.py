start = 10 ** 15

x = start
i = 1
ownerPart = -start // 100
while x - ownerPart >= (start // 100):
    print(i, x, x - ownerPart < start // 100)
    x -= x // 100
    ownerPart += x // 100
    i += 1
print(x - ownerPart < start // 100)
