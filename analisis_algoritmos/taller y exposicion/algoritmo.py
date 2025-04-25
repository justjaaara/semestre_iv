def corte_varillas(precios, n):
    if n == 0:
        return 0
    max_valor = float('-inf')

    for i in range(1, n + 1):
        # Consideramos que cortamos la varilla de longitud i y vendemos el resto (n-i)
        max_valor = max(max_valor, precios[i - 1] + corte_varillas(precios, n - i))

    return max_valor

# Ejemplo de uso
precios = [1, 5, 8, 9, 10, 17, 17, 20]
longitud_varilla = 8
resultado = corte_varillas(precios, longitud_varilla)
print(f"El valor máximo que se puede obtener es: {resultado}")
# El valor máximo que se puede obtener es: 22
