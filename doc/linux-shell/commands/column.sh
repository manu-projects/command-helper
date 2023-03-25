## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: imprimir información de archivos
## DESCRIPCION: muestra el contenido en columnas
##
## OBSERVACIONES: -
## ####################################################################

# Listar las cuentas de usuario del sistema en un formato más entendible
#
# - la opción -t (table) refiere a visualizar los datos en un formato de tabla)
# - la opción -s (separator) solicita el caracter que actúa como Separador de columnas (Ej. en .csv es la coma)
column -t -s ":" /etc/passwd

# Listar todos los archivos y directorios en un 5 columnas
# (podemos omitir la opción -t ó --verbose, son sólo para entender que ocurre)
ls -a /home/jelou/Descargas | xargs --verbose --max-args=5 | column -t -s " "
ls -a /home/jelou/Descargas | xargs -t -n 5 | column -t -s " "

# Ejecutar la siguiente linea, para generar un archivo de ejemplo y practicar el siguiente comando column
echo "numero_legajo,nombre,fecha_nacimiento" >> alumnos.csv && (seq 9 | xargs -I % echo "00%,desconocido,199%" >> alumnos.csv

# Listar contenido de un archivo CSV en columnas
# (el formato .csv usa el caracter de la coma "," como delimitador para separar las columnas)
column -t -s "," alumnos.csv
