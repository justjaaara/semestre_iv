class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
        self.parent = None

class MinHeap:
    def __init__(self):
        self.root = None
        self.size = 0
    
    def insert(self, value):
        new_node = Node(value)
        if not self.root:
            self.root = new_node  # Si el heap está vacío, el nuevo nodo es la raíz
        else:
            # Encontrar la posición donde insertar el nuevo nodo (basado en el orden de un árbol completo)
            parent = self._find_parent(self.size + 1)
            if not parent.left:
                parent.left = new_node
            else:
                parent.right = new_node
            new_node.parent = parent
            # Asegurar que se mantenga la propiedad de min-heap
            self._heapify_up(new_node)
        self.size += 1
    
    def _find_parent(self, index):
        """ Encuentra el padre del nodo que se insertaría en la posición `index` usando BFS """
        path = bin(index)[3:]  # Convertir el índice a binario para obtener el camino al nodo
        current = self.root
        for direction in path[:-1]:  # Recorrer los nodos según el camino
            if direction == '0':
                current = current.left
            else:
                current = current.right
        return current

    def _heapify_up(self, node):
        """ Asegura que se mantenga la propiedad de min-heap flotando hacia arriba """
        while node.parent and node.value < node.parent.value:
            # Intercambiar valores con el padre
            node.value, node.parent.value = node.parent.value, node.value
            node = node.parent
    
    def _level_order(self, node):
        """ Retorna los valores del heap en orden por niveles (BFS) para visualización """
        if not node:
            return []
        result = []
        queue = [node]
        while queue:
            current = queue.pop(0)
            result.append(current.value)
            if current.left:
                queue.append(current.left)
            if current.right:
                queue.append(current.right)
        return result

    def __str__(self):
        """ Retorna la representación en niveles del heap """
        return str(self._level_order(self.root))

# Ejemplo de uso:
min_heap = MinHeap()
min_heap.insert(10)
min_heap.insert(5)
min_heap.insert(30)
min_heap.insert(2)
min_heap.insert(7)

print(min_heap)  # Muestra el heap: [2, 5, 30, 10, 7]
