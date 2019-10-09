def merge(a1, a2):
    if a1 == [] and a2 == []:
        return []
    if a1 == []:
        return a2
    if a2 == []:
        return a1

    return [a1[0]] + merge(a1[1:], a2) if a1[0] < a2[0] else [a2[0]] + merge(a1, a2[1:])

def merge_iter(a1, a2):
    i = j = 0
    while i < len(a1) or 

def test():
    a1 = [1, 3, 5, 6, 7]
    a2 = [2, 4, 5, 8, 9]
    print(merge(a1, a2))

if __name__ == "__main__":
    test()