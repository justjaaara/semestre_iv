personas = [
    {'nombre': 'Luis', 'edad': 34},
    {'nombre': 'Ana', 'edad': 29},
    {'nombre': 'Mario', 'edad': 40},
    {'nombre': 'Ana', 'edad': 22},
    {'nombre': 'Luis', 'edad': 25},
    {'nombre': 'Beatriz', 'edad': 30},
]


'''
Algoritmo que ordene por nombre y si tienen el mismo nombre, que ordene por edad
'''

def ordenar_lista(lista: list):

    for i in range(len(lista)) :
        for j in range(0,len(lista)-i-1):
            nombre_actual = lista[j]['nombre']
            nombre_siguiente = lista[j+1]['nombre']

            edad_actual = lista[j]['edad']
            edad_siguiente = lista[j+1]['edad']
            if ((nombre_actual == nombre_siguiente) and (edad_actual > edad_siguiente)) or (nombre_actual > nombre_siguiente):
                lista[j], lista[j+1] = lista[j+1], lista[j] 

    return lista
print(personas)
print('-------------------------------------------')
new_list = ordenar_lista(personas)
print('New list')
print(new_list)



            


        
