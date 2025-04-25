import random
import networkx as nx
import matplotlib.pyplot as plt
import heapq
import time
import numpy as np

# Clase que representa un grafo dirigido y ponderado (ciudad con calles)
class GrafoCiudad:
    def __init__(self):
        # Utilizamos NetworkX para manejar el grafo dirigido
        self.grafo = nx.DiGraph()

    # Método para agregar una nueva calle (arista) con una distancia (peso)
    def agregar_calle(self, origen, destino, distancia):
        self.grafo.add_edge(origen, destino, weight=distancia)

    # Método para mostrar el grafo simulando las calles de una ciudad
    def mostrar_ciudad(self, nombre_archivo="grafo_ciudad.png"):
        plt.figure(figsize=(8, 6))
        pos = {nodo: (nodo % ancho, nodo // ancho) for nodo in self.grafo.nodes}  # Generar las posiciones en forma de cuadrícula
        nx.draw(self.grafo, pos, with_labels=True, node_color='lightblue', node_size=500, font_size=10, font_weight='bold', arrows=True)
        labels = nx.get_edge_attributes(self.grafo, 'weight')
        nx.draw_networkx_edge_labels(self.grafo, pos, edge_labels=labels)
        plt.title("Simulación de Ciudad: Rutas de Entregas")
        plt.savefig(nombre_archivo)  # Guardar el gráfico como archivo
        print(f"Grafo de la ciudad guardado como {nombre_archivo}")

    # Algoritmo de Dijkstra para encontrar la ruta más corta desde inicio a destino
    def dijkstra(self, inicio, destino):
        distancias = {nodo: float('inf') for nodo in self.grafo.nodes}
        distancias[inicio] = 0
        cola_prioridad = [(0, inicio)]
        camino = {inicio: None}  # Para reconstruir el camino más corto

        while cola_prioridad:
            distancia_actual, nodo_actual = heapq.heappop(cola_prioridad)
            if nodo_actual == destino:
                break  # Ya llegamos al destino, no necesitamos seguir
            for vecino in self.grafo.neighbors(nodo_actual):
                peso = self.grafo[nodo_actual][vecino]['weight']
                distancia_total = distancia_actual + peso
                if distancia_total < distancias[vecino]:
                    distancias[vecino] = distancia_total
                    heapq.heappush(cola_prioridad, (distancia_total, vecino))
                    camino[vecino] = nodo_actual  # Guardar el nodo anterior en el camino

        # Reconstruir el camino más corto
        ruta = []
        nodo_actual = destino
        while nodo_actual is not None:
            ruta.append(nodo_actual)
            nodo_actual = camino[nodo_actual]
        ruta.reverse()  # Invertir para tener de inicio a destino

        return distancias[destino], ruta

# Función para crear un grafo dirigido en forma de cuadrícula (ciudad)
def crear_ciudad(ancho, alto):
    grafo = GrafoCiudad()
    total_nodos = ancho * alto

    # Generar intersecciones como nodos (0, 1, 2,...)
    for nodo in range(total_nodos):
        fila, columna = nodo // ancho, nodo % ancho
        
        # Conectar a la derecha (si no estamos en el borde derecho)
        if columna < ancho - 1:
            destino = nodo + 1
            distancia = random.randint(1, 10)  # Distancias aleatorias para simular calles
            grafo.agregar_calle(nodo, destino, distancia)
        
        # Conectar hacia abajo (si no estamos en el borde inferior)
        if fila < alto - 1:
            destino = nodo + ancho
            distancia = random.randint(1, 10)
            grafo.agregar_calle(nodo, destino, distancia)

        # Para hacerlo más realista, podemos agregar direcciones inversas (bidireccionales)
        if columna < ancho - 1:
            grafo.agregar_calle(nodo + 1, nodo, random.randint(1, 10))
        if fila < alto - 1:
            grafo.agregar_calle(nodo + ancho, nodo, random.randint(1, 10))

    return grafo

# Función para encontrar el camino más corto entre todos los pares de nodos usando Floyd-Warshall
def floyd_warshall(grafo, total_nodos):
    # Crear una matriz de distancias inicializadas con infinito
    distancias = np.full((total_nodos, total_nodos), float('inf'))
    caminos = np.full((total_nodos, total_nodos), -1)

    # Inicializar las distancias con los pesos de las aristas
    for nodo in grafo.nodes:
        distancias[nodo][nodo] = 0  # Distancia a sí mismo es 0
        for vecino in grafo.neighbors(nodo):
            peso = grafo[nodo][vecino]['weight']
            distancias[nodo][vecino] = peso
            caminos[nodo][vecino] = vecino

    # Aplicar el algoritmo de Floyd-Warshall
    for k in range(total_nodos):
        for i in range(total_nodos):
            for j in range(total_nodos):
                if distancias[i][j] > distancias[i][k] + distancias[k][j]:
                    distancias[i][j] = distancias[i][k] + distancias[k][j]
                    caminos[i][j] = caminos[i][k]

    return distancias, caminos

# Función para reconstruir el camino más corto desde un nodo inicio a un nodo destino
def reconstruir_camino(caminos, inicio, destino):
    if caminos[inicio][destino] == -1:
        return []  # No hay camino
    camino = [inicio]
    while inicio != destino:
        inicio = caminos[inicio][destino]
        camino.append(inicio)

    # Convertir el camino a enteros estándar de Python para evitar np.int64
    return [int(nodo) for nodo in camino]

# Aplicación a nuestro grafo de ciudad
def encontrar_camino_mas_corto_floyd(ciudad, inicio, destino):
    total_nodos = len(ciudad.grafo.nodes)
    
    # Ejecutar Floyd-Warshall
    distancias, caminos = floyd_warshall(ciudad.grafo, total_nodos)
    
    # Obtener el camino más corto y la distancia mínima
    distancia_minima = distancias[inicio][destino]
    camino_optimo = reconstruir_camino(caminos, inicio, destino)
    
    return distancia_minima, camino_optimo

# Método de Divide y Vencerás
def camino_mas_corto_divide_y_venceras(self, inicio, destino):
    # Caso base: Si el inicio es igual al destino, retornar 0
    if inicio == destino:
        return 0, [inicio]

    # Inicializar variables para la mejor distancia y ruta
    mejor_distancia = float('inf')
    mejor_ruta = None

    # Iterar sobre los vecinos del nodo actual
    for vecino in self.grafo.neighbors(inicio):
        distancia, ruta = self.camino_mas_corto_divide_y_venceras(vecino, destino)
        
        # Evitar la recursión si no hay un camino válido
        if distancia == float('inf'):
            continue
        
        distancia += self.grafo[inicio][vecino]['weight']

        # Comparar con la mejor distancia encontrada
        if distancia < mejor_distancia:
            mejor_distancia = distancia
            mejor_ruta = [inicio] + ruta

    return mejor_distancia, mejor_ruta if mejor_ruta else (float('inf'), [])

# Añadir el método a la clase GrafoCiudad
GrafoCiudad.camino_mas_corto_divide_y_venceras = camino_mas_corto_divide_y_venceras

# Definir el tamaño de la ciudad (cuadrícula de intersecciones)
ancho = 5  # Número de intersecciones por fila
alto = 4   # Número de filas de intersecciones
ciudad = crear_ciudad(ancho, alto)

# Mostrar el grafo de la ciudad generado
ciudad.mostrar_ciudad()

# Usar Dijkstra para encontrar la ruta más corta desde un nodo de inicio a un nodo de destino
inicio = 0   # Esquina superior izquierda (puede cambiarse)
destino = 15  # Un nodo cualquiera dentro de la cuadrícula (puede cambiarse)

# Dijkstra
tiempo_inicial_dj = time.time()
distancia_minima, ruta_optima = ciudad.dijkstra(inicio, destino)
tiempo_final_dj = time.time()
tiempo_ejecucion_dj = tiempo_final_dj - tiempo_inicial_dj

# Floyd-Warshall
tiempo_inicial_floyd = time.time()
distancia_minima_floyd, ruta_optima_floyd = encontrar_camino_mas_corto_floyd(ciudad, inicio, destino)
tiempo_final_floyd = time.time()
tiempo_ejecucion_floyd = tiempo_final_floyd - tiempo_inicial_floyd

# Divide y Vencerás
tiempo_inicial_dvyv = time.time()
#distancia_minima_dvyv, ruta_optima_dvyv = ciudad.camino_mas_corto_divide_y_venceras(inicio, destino)
tiempo_final_dvyv = time.time()
tiempo_ejecucion_dvyv = tiempo_final_dvyv

###################################################################################################

def prueba_sobrecarga():
    # Probar con diferentes tamaños de la ciudad
    tamanos_ciudad = [(5, 4), (10, 8), (15, 12), (20, 16), (25, 20)]  # Diferentes tamaños de cuadrícula
    inicio = 0  # Mantener el mismo nodo de inicio
    destino = 0  # Nodo inicial temporal, lo ajustaremos según el tamaño de la cuadrícula

    for ancho, alto in tamanos_ciudad:
        ciudad = crear_ciudad(ancho, alto)
        destino = ancho * alto - 1  # Ajustar el nodo destino como el último nodo de la cuadrícula

        # Prueba con Dijkstra
        tiempo_inicial_dj = time.time()
        distancia_minima_dj, ruta_optima_dj = ciudad.dijkstra(inicio, destino)
        tiempo_final_dj = time.time()
        tiempo_ejecucion_dj = tiempo_final_dj - tiempo_inicial_dj

        # Prueba con Floyd-Warshall
        tiempo_inicial_floyd = time.time()
        distancia_minima_floyd, ruta_optima_floyd = encontrar_camino_mas_corto_floyd(ciudad, inicio, destino)
        tiempo_final_floyd = time.time()
        tiempo_ejecucion_floyd = tiempo_final_floyd - tiempo_inicial_floyd

        # Mostrar resultados
        print(f"\n--- Tamaño de la ciudad: {ancho}x{alto} ---")
        print(f"Dijkstra - Tiempo de ejecución: {tiempo_ejecucion_dj:.5f} segundos | Distancia: {distancia_minima_dj}")
        print(f"Floyd-Warshall - Tiempo de ejecución: {tiempo_ejecucion_floyd:.5f} segundos | Distancia: {distancia_minima_floyd}")

def prueba_estres():
    # Usar una ciudad muy grande para estresar el sistema
    ancho, alto = 100, 100  # Una ciudad de 10,000 intersecciones (100x100)
    ciudad = crear_ciudad(ancho, alto)
    inicio = 0
    destino = ancho * alto - 1  # Último nodo en la cuadrícula

    print(f"\n--- Prueba de Estrés: Ciudad de {ancho}x{alto} ---")

    # Prueba con Dijkstra
    tiempo_inicial_dj = time.time()
    distancia_minima_dj, ruta_optima_dj = ciudad.dijkstra(inicio, destino)
    tiempo_final_dj = time.time()
    tiempo_ejecucion_dj = tiempo_final_dj - tiempo_inicial_dj

    print(f"Dijkstra - Tiempo de ejecución: {tiempo_ejecucion_dj:.5f} segundos | Distancia: {distancia_minima_dj}")
    
    # Prueba con Floyd-Warshall
    tiempo_inicial_floyd = time.time()
    distancia_minima_floyd, ruta_optima_floyd = encontrar_camino_mas_corto_floyd(ciudad, inicio, destino)
    tiempo_final_floyd = time.time()
    tiempo_ejecucion_floyd = tiempo_final_floyd - tiempo_inicial_floyd

    print(f"Floyd-Warshall - Tiempo de ejecución: {tiempo_ejecucion_floyd:.5f} segundos | Distancia: {distancia_minima_floyd}")

# Ejecutar las pruebas
prueba_sobrecarga()  # Prueba de sobrecarga con diferentes tamaños
prueba_estres()      # Prueba de estrés con un grafo muy grande
