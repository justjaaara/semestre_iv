import math
def min_cuadrados(n):
    if n <= 3:
        return n
    res = n # En el peor de los casos, la respuesta es n (1^2 + 1^2 + ... + 1^2)

    for i in range(1, int(math.sqrt(n)) + 1):
        temp = i * i
        res = min(res, 1 + min_cuadrados(n - temp))

    return res


print(min_cuadrados(10))

import math

def min_cuadrados_memo(number, memo_dict={}):
    if number in memo_dict:
        return memo_dict[number]
    if number <= 3:
        return number
    result = number  # En el peor de los casos, la respuesta es n (1^2 + 1^2 + ... + 1^2)

    for i in range(1, int(math.sqrt(number)) + 1):
        temporal_number = i * i
        result = min(result, 1 + min_cuadrados_memo(number - temporal_number, memo_dict))

    memo_dict[number] = result
    return result

print(min_cuadrados_memo(10))
