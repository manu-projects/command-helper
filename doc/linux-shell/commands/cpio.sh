## ####################################################################
## ACTUALIZADO: 29/03/2023
##
## CATEGORIA: archivador
## DESCRIPCION: comprimir/descomprimir archivos y directorios
##
## OBSERVACIONES: refiere a Copy IN+Copy OUT y es útil durante la instalación de un OS (que no incluye tar, zip, ..)
## ####################################################################

# 1. Comprimir archivos "de la ruta actual" en un archivo .cpio
ls *.txt \
    | cpio --create --verbose > compress.cpio

# 2. Comprimir los archivos "de todos los subdirectorios" de una ruta, en un archivo .cpio
#
# - el . indica la ruta en la que estamos ubicados (ó podriamos haber colocado una ruta absoluta /home/myapp)
#
# - operador de redirección (>): redirecciona el STDOUT a un archivo
# - operador de redirección (|): redirecciona el STDOUT de un comando como STDIN de otro comando
find . -name '*.txt' \
    | cpio --create --verbose > compress.cpio

# 3. Extraer archivos de un archivo .cpio
cpio --extract --verbose --file < compress.cpio

# 4. Crear un archivo con un formato específico (Ej. tar)
ls *.txt \
    | cpio --create --verbose --format=tar > compress.cpio.tar

# (alternativa si tuvieramos el programa tar)
tar --create --verbose --file=compress.tar *.txt
tar -cvf compress.tar
tar -cvzf compress.tar.gz
