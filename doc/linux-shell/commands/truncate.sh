## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: operaciones sobre archivos
## DESCRIPCION: recorta el tamaño de un archivo (truncar un archivo)
##
## OBSERVACIONES: se puede probar con el comando find, éste busca archivos por su tamaño
## ####################################################################

# Limpiar el contenido del archivo, lo deja con 0 Bytes
truncate -s 0 archivo.txt

# Truncar el archivo a 100 Bytes (si era de 10Mb, entonces se perderán datos)
truncate -s 100 archivo.txt

# Aumentar el tamaño del archivo en +100k (es decir 100*1024 Bytes)
#
# - las unidades son (K) Kilobytes, (M) Megabytes, (G) Gigabytes, (T) Terabytes, (P) Petabytes
truncate -s +100K archivo.txt

# Aumentar el tamaño 10 Megabytes
truncate -s +10M archivo.txt

# Aumentar el tamaño 1 Gigabytes
truncate -s +1G archivo.txt

# Reducir el tamaño del archivo en -100k
truncate -s -100k archivo.txt
