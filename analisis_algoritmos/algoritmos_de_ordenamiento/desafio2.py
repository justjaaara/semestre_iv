def merge(arr, left, middle, right):
    # Tamaño de las sublistas
    n1 = middle - left + 1
    n2 = right - middle

    # Crear listas temporales
    left_list  = arr[left:middle + 1]
    right_list  = arr[middle + 1:right + 1]

    # Índices iniciales de las sublistas y de la lista principal
    i = j = 0
    k = left

    # Combinar las sublistas en orden ascendente
    while i < n1 and j < n2:
        if left_list [i][1] == right_list [j][1]:
            if left_list [i][2] < right_list [j][2]:
                arr[k] = left_list [i]
                i += 1
            else:
                arr[k] = right_list [j]
                j += 1
        elif left_list [i][1] < right_list [j][1]:
            arr[k] = left_list [i]
            i += 1
        else:
            arr[k] = right_list [j]
            j += 1
        k += 1

    # Copiar los elementos restantes de left_list [] si quedan
    while i < n1:
        arr[k] = left_list [i]
        i += 1
        k += 1

    # Copiar los elementos restantes de right_list [] si quedan
    while j < n2:
        arr[k] = right_list [j]
        j += 1
        k += 1

def mergesort(arr, left, right):
    if left < right:
        # Encontrar el punto medio de la lista
        middle = (left + right) // 2

        # Ordenar la primera y la segunda mitad
        mergesort(arr, left, middle)
        mergesort(arr, middle + 1, right)

        # Combinar las dos mitades ordenadas
        merge(arr, left, middle, right)

# Ejemplo de uso

proyectos = [
    (1, 50000, 12),
    (2, 75000, 8),
    (3, 50000, 10),
    (4, 100000, 15),
    (5, 75000, 6)
]

print("Array original:", proyectos)
mergesort(proyectos, 0, len(proyectos) - 1)
print("Array ordenado:", proyectos)