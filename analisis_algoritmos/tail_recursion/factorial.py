def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

def factorial_tail_recursive(n, acumulador = 1):
    if n == 0:
        return acumulador
    else:
        return factorial_tail_recursive(n-1, acumulador * n)