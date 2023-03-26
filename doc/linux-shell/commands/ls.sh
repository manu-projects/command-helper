## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: listar archivos y directorios
## DESCRIPCION: mostrar nombre y tipo de archivo, permisos de acceso, ...
##
## OBSERVACIONES: -
## ####################################################################

# Contar cantidad de archivos/directorios
ls | wc -c

# Filtrar las entradas del directorio sin usar `grep`
ls *pdf

# Listar archivos ocultos
ls -la

# Listar archivos ordenados por fecha de creación/actualización
ls -lt

# Listar archivos ordenados por tamaño del archivo
ls -ls

# Listar archivos ordenados por tamaño del archivo (en un formato más entendible)
ls -lsh

# Listar los 4 archivos más recientes
ls -lth | head -n4

# Listar los 2 archivos más antiguos
ls -lth | tail -n2
