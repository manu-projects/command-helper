## ####################################################################
## ACTUALIZADO: 11/04/2023
##
## CATEGORIA: imprimir/listar valores
## DESCRIPCION: generar una secuencia de números
##
## OBSERVACIONES: probarlo en un directorio temporal ejecutando cd `mktemp --directory`
## ####################################################################

# ..........................................................................
# 1. Imprimir una secuencia de números de 1 en 1, dando sólo el valor final
# ..........................................................................
#
# - al pasarle sólo 1 parámetro, sería lo mismo que poner `seq 1 1 5`
# - el valor inicial es opcional, por default es 1
# - el valor incremental es opcional, por default es 1
#
# - opción (--separator): si no se define, el caracter separador entre números por default es el salto de linea \n

seq 5 # 1\n 2\n .. 4\n 5\n

# ......................................................................................
# 2. imprimir una secuencia de números entre un rango de números (con incrementos de 1)
# ......................................................................................
#
# - al pasarle sólo 2 parámetros, sería lo mismo que poner `seq 5 1 10`
# - el valor incremental es opcional, por default es 1
#
seq 1 10 #  1\n 2\n .. 9\n 10\n
seq 5 10 #  5\n 6\n .. 9\n 10\n

# alternativas a lo anterior, utilizando el ciclo "for" de la bash shell
for i in `seq 1 5`; do echo $i; done;  # 1\n .. 5\n
for i in $(seq 1 5); do echo $i; done; # 1\n .. 5\n

# .............................................................................
# 3. Imprimir una secuencia de números con un caracter separador entre números
# .............................................................................
#
# - la opción (--separator): define el caracter separador entre los números, por default es el salto de linea \n
seq --separator="," 1 10 # 1,2,..,9,10
seq --separator=" " 1 10 # 1 2 .. 9 10

# alternativa al separador con espacio, utilizando el comando `xargs`
# (no suele suele utilizar el comando xargs para esto, y quizás hasta no es tan expresivo pero también funciona)
seq 1 10 | xargs

# .......................................................................
# 4. Crear múltiples archivos ó directorios con una secuencia de números
# .......................................................................

# Nota: para valores aleatorios utilizar el comando `mktemp` (crea archivos y directorios)

# 4.1 Crear múltiples archivos con una numeración del 1 al 10 (Ej. archivo-1, archivo-2, .., archivo-10)

# alternativa (1) sin `seq`
# - el comando `touch` no tiene la opción --verbose, por tanto éste no imprimiría que archivos fueron creados
touch archivo-{1..10}.txt

# alternativa (2) sin `seq`
# (el resultado será lo mismo que ejecutar `touch archivo-1.txt archivo-2.txt .. archivo-10.txt`)
echo archivo-{1..10}.txt | xargs --verbose touch

# alternativa (3) con `seq`
seq --format="archivo-%g.txt" 10 | xargs --verbose touch

# 4.2 Crear múltiples directorios con el mismo objetivo (usaremos comando mkdir)
mkdir --verbose carpeta-{1..10}
echo carpeta-{1..10}.txt | xargs --verbose mkdir
seq --format="carpeta-%g" 10 | xargs mkdir --verbose

# 4.3 Crear múltiples archivos/directorios pero con un comportamiento diferente a los anteriores ejemplos
#
# - el comando `seq` utiliza el caracter \n (salto de linea) como separador entre cada número
# (por tanto el comando xargs se ejecutará N veces, siendo N la longitud de la secuencia de números que devuelva `seq`)

# si queremos un comando más genérico que.. `mkdir -v carpeta-1; mkdir -v carpeta-2; ..; mkdir -v carpeta-10`
# (con el ; indicamos el fin de un comando o de varios agrupados, cada comando se ejecutará de forma independiente y en distintos instantes de tiempo)
seq 10 | xargs -I {} mkdir "carpeta-{}" --verbose

# (alternativa utilizando la opción --max-args del comando xargs)
echo archivo-{1..10}.txt | xargs --max-args=1 --verbose touch

# si queremos un comando más genérico que.. `touch archivo-1.txt; touch archivo-2.txt; ..; touch archivo-10.txt`
seq 10 | xargs --verbose -I {} touch "archivo-{}.txt"
echo carpeta-{1..10} | xargs --max-args=1 mkdir --verbose

# ...................................................................
# 5. imprimir una secuencia de números, con un incremental mayor a 1
# ...................................................................

seq 1 2 10 # (incremental=2) el resultado sería 1\n 3\n 5\n 7\n 9\n
seq 1 3 10 # (incremental=3) el resultado sería 1\n 4\n 7\n
seq 1 4 10 # (incremental=4) el resultado sería 1\n 5\n

# alternativas a los ej anteriores, usando el ciclo for de la bash shell
# similar a un for(i=1; n<=10, i+=2) ó.. for(inicial=1, salto=2, final=10; inicial<=final; inicial+=salto)
for i in {1..10..2}; do echo $i; done; # resultado sería 1\n 3\n 5\n 7\n 9\n
#
# algo similar a for(i=1, n=10; i<=n; i+=3)
for i in {1..10..3}; do echo $i; done; # resultado sería 1\n 3\n 5\n 7\n
#
# algo similar a for(i=1, n=10; i<=n; i+=4)
for i in {1..10..4}; do echo $i; done; # resultado sería 1\n 5\n
