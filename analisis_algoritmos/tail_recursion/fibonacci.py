def fibonacci(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def fibonacci_tail(n, anterior = 0, tras_anterior=1):
    if n == 0:
        return anterior
    elif n == 1:
        return tras_anterior
    else:
        return fibonacci_tail(n-1,tras_anterior, anterior+tras_anterior)

#Casos de prueba

print(fibonacci(20))
print('tail', fibonacci_tail(20))