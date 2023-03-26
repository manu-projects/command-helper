## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: contenido de archivos
## DESCRIPCION: ordenar contenido por criterios (número de columna, repetidos, no repetidos)
##
## OBSERVACIONES: -
## ####################################################################

# Ejecutar la siguiente linea, para generar un archivo de ejemplo y practicar el siguiente comando sort
truncate --size=0 alumnos.txt && seq 10 | xargs -I{} echo "alumno {}" >> alumnos.txt

# Ordenar un archivo por la segunda columna (numérica) de forma descendente
sort alumnos.txt --key=2 --numeric-sort
sort alumnos.txt -k 2 -n
sort alumnos.txt -nk 2


# Ejecutar la siguiente linea, para generar un archivo de ejemplo y practicar el siguiente comando sort
truncate --size=0 alumnos.txt && seq 10 | xargs -I{} echo "pepe | argentino | {}" >> alumnos.txt && sed -i '1,2 s/a/c/; 3,5 s/a/z/; 6,8 s/a/c/' alumnos.txt

# ordenar un archivo por la segunda columna y que tiene el símbolo | pipe como delimitador (separador de campos)
sort alumnos.txt --field-separator "|" --key=2
sort alumnos.txt -t "|" -k 2
sort alumnos.txt -k 2


# Ejecutar la siguiente linea, para generar un archivo de ejemplo y practicar el siguiente comando sort
echo -n "" > nombres-duplicados.txt && timeout 5 bash -c 'while true; do echo "escribiendo.."; echo "carlos" >> nombres-duplicados.txt ; sleep 1; done;'

# Remover las lineas repetidas
sort --unique nombres-duplicados.txt > nombres-sin-repetir.txt
sort -u nombres-duplicados.txt > nombres-sin-repetir.txt
