def asignacion_aproximada(costos):
    n = len(costos)  # número de trabajadores y tareas
    tareas_asignadas = [False] * n  # Para rastrear qué tareas ya han sido asignadas
    trabajadores_asignados = [-1] * n  # Asignación de tareas a trabajadores

    for i in range(n):
        # Para cada trabajador, asignamos la tarea de menor costo disponible
        min_costo = float('inf')
        tarea_elegida = -1
        
        for j in range(n):
            if not tareas_asignadas[j] and costos[i][j] < min_costo:
                min_costo = costos[i][j]
                tarea_elegida = j

        # Asignamos la tarea elegida al trabajador actual
        trabajadores_asignados[i] = tarea_elegida
        tareas_asignadas[tarea_elegida] = True

    return trabajadores_asignados

# Ejemplo de uso
costos =[[9, 2, 7],
                   [6, 4, 3],
                   [5, 8, 1]]

asignacion = asignacion_aproximada(costos)
print(f"Tareas asignadas a los trabajadores: {asignacion}")