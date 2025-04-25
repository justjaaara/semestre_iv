import time

def grid_paths(m, n):
    if m == 1 or n == 1:
        return 1
    return grid_paths(m-1, n) + grid_paths(m, n-1)

# Ejemplo de uso
start_time = time.time()
print(grid_paths(10, 10))  # Devuelve 6
end_time = time.time()
print('Tiempo sin memo')
print(end_time-start_time)


def grid_paths_memo(m, n, memo = None):
    if memo is None:
        memo = {}
    if (m,n) in memo:
        return memo[(m,n)]
    if m == 1 or n==1:
        return 1
    memo[(m,n)] = grid_paths_memo(m-1, n,memo) + grid_paths_memo(m, n-1,memo)
    return memo[(m,n)]


start_time = time.time()
print('memo: ',grid_paths_memo(10,10))
end_time = time.time()
print('Tiempo con memo')
print(end_time-start_time)



