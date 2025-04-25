def invert_string (string,first_half=None, indice =0, mitad=0, resultado = ''):
    if string == '':
        return first_half + resultado
    if mitad == 0:
        mitad = len(string)//2
    if indice <mitad:
        return invert_string(string,first_half, indice +1, mitad, resultado)
    else:
        if first_half is None:
            first_half = string[:indice]
        return invert_string(string[indice:],first_half, indice +1, mitad, string[0]+ resultado)

print(invert_string('hola'))
