def mystery_function(n):
    for i in range(n):  # Bucle externo
        j = 1
        print("-------------")
        while j < n:     # Bucle interno
            print(i, j)
            j *= 2

mystery_function(30)

La ecuación de recurrencia es:

𝑥
𝑛
=
5
𝑥
𝑛
−
1
−
6
𝑥
𝑛
−
2
x 
n
​
 =5x 
n−1
​
 −6x 
n−2
​
 
Las raíces del polinomio característico 
𝑟
2
−
5
𝑟
+
6
=
0
r 
2
 −5r+6=0 son 
𝑟
=
2
r=2 y 
𝑟
=
3
r=3.

La solución general es de la forma:

𝑥
𝑛
=
𝐴
⋅
2
𝑛
+
𝐵
⋅
3
𝑛
x 
n
​
 =A⋅2 
n
 +B⋅3 
n
 
Usamos las condiciones iniciales 
𝑥
0
=
2
x 
0
​
 =2 y 
𝑥
1
=
5
x 
1
​
 =5 para encontrar 
𝐴
A y 
𝐵
B:

𝑥
0
=
𝐴
+
𝐵
=
2
x 
0
​
 =A+B=2
𝑥
1
=
2
𝐴
+
3
𝐵
=
5
x 
1
​
 =2A+3B=5
Resolviendo el sistema:

De 
𝐴
+
𝐵
=
2
A+B=2, tenemos 
𝐵
=
2
−
𝐴
B=2−A.
Sustituyendo en 
2
𝐴
+
3
𝐵
=
5
2A+3B=5:
2
𝐴
+
3
(
2
−
𝐴
)
=
5
  
⟹
  
2
𝐴
+
6
−
3
𝐴
=
5
  
⟹
  
−
𝐴
=
−
1
  
⟹
  
𝐴
=
1
2A+3(2−A)=5⟹2A+6−3A=5⟹−A=−1⟹A=1
Entonces, 
𝐵
=
2
−
𝐴
=
1
B=2−A=1.
La solución cerrada es:

𝑥
𝑛
=
2
𝑛
+
3
𝑛
x 
n
​
 =2 
n
 +3 
n