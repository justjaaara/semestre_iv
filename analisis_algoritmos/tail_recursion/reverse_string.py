def reverse_string(s):
    if s == "":
        return s
    else:
        return reverse_string(s[1:]) + s[0]

def reverse_string_tail(s, result=""):
    if s == "":
        return result
    else:
        return reverse_string_tail(s[1:],s[0] + result)

print(reverse_string_tail('Hola mundo'))


