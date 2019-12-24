path = [[50, 10, 30], [5, 90, 20], [40, 2, 25], [10, 8, 0]]

def dp():
    a = 0
    b = 0

    for item in path:
        aa = a
        bb = b
        if a + item[0] > b + item[1] + item[2]:
            aa = b + item[1] + item[2]
        else:
            aa += item[0]

        if b + item[1] > a + item[0] + item[2]:
            bb = a + item[0] + item[2]
        else:
            bb += item[1]

        a = aa
        b = bb

    return min(a, b)


print(dp())
