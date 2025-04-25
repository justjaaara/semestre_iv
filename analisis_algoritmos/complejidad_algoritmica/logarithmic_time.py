# O(log(n))


def logarithmic_time(n):
    count = 0
    while n > 1:
        n //= 2
        count += 1
    return count


print(logarithmic_time(1000))
