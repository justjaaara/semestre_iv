def es_valido(tablero, fila, col):
    for i in range(fila):
        if tablero[i] == col or \
           tablero[i] - i == col - fila or \
           tablero[i] + i == col + fila:
            return False
    return True

def resolver_n_reinas(tablero, fila, N):
    if fila == N:
        print(tablero)
        return True
    for col in range(N):
        if es_valido(tablero, fila, col):
            tablero[fila] = col
            if resolver_n_reinas(tablero, fila + 1, N):
                return True
            tablero[fila] = -1  # backtracking
    return False

def n_reinas(N):
    tablero = [-1] * N
    resolver_n_reinas(tablero, 0, N)

# Ejemplo con 4 reinas
n_reinas(4)
