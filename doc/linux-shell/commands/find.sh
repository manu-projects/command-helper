## ####################################################################
## ACTUALIZADO: 25/03/2023
##
## CATEGORIA: listar archivos y directorios
## DESCRIPCION: buscar archivos por nombre, tipo, tamaño ó fecha
##
## OBSERVACIONES: en la doc del comando date, hay más ejemplos
## ####################################################################

# .............................................
# EJEMPLOS: OTROS
# .............................................

# 1. Eliminar archivos (más rápido que el comando rm)
#
# - opción (-print): imprime por pantalla los archivos que encuentra
find . -type f -delete -print


# .............................................
# EJEMPLOS: BUSCAR POR NOMBRE ó TIPO DE ARCHIVO
# .............................................

# 1. Buscar archivos que coincidan con un patrón (Ej. *.log.gz) en "todos los subdirectorios"
#
# - opción (-type): el tipo de archivo.. (f) archivo regular, ó (d) directorio, ó (l) softlink
# - opción (-maxdepth): si NO especificamos el nivel de profundidad, buscará en TODOS los subdirectorios (todos los niveles)
find /var/log/nginx \
     -type f \
     -name '*.log.gz'

# 2. Buscar archivos que coincidan con un patrón (Ej. *.log.gz) en "un directorio"
#
# - opción (-maxdepth): máximo nivel de profundidad de directorios a buscar
find /var/log/nginx \
     -type f \
     -name '*.log.gz' \
     -maxdepth 1

# 3. Buscar archivos en "todos los subdirectorios"
find /var/log/nginx -type f

# 4. Buscar directorios y subdirectorios
find /var/log/nginx -type d

# 5. Buscar archivos que coincidan con "un nombre específico" (en todos los subdirectorios)
#
# - opción (-name): el nombre del archivo, es sensible a mayúsculas/minúsculas
find /var/log/nginx \
     -type f \
     -name 'error.log'

# 6. Buscar archivos que coincidan "casi" con un nombre específico
#
# - opción (-iname): el nombre del archivo, NO es sensible (no distingue) a mayúsculas/minúsculas
# (podría encontrar error.log, ERROR.log, Error.log, ..)
find /var/log/nginx \
     -type f \
     -iname 'error.c'

# 7. Buscar archivos que NO coincidan con un nombre específico
#
# - opción (-not): niega la opción siguiente (Ej. -name, -iname, ...)
find /var/log/nginx \
     -type f \
     -not -name 'error.log'

# ...........................
# EJEMPLOS: BUSCAR POR TAMAÑO
# ...........................

# 1. Buscar archivos que tengan exactamente 10 Megabytes
#
# - opción (-size): tamaño del archivo seguido de la unidad (c) Bytes, (k) Kilobytes, (M) Megabytes, (G) Gigabytes
find /var/log/nginx \
     -type f \
     -size 10M

# 2. Buscar archivos MENORES a 1 Gigabytes
#
# - prefijo (-): actúa como el operador relacional < "menor que .."
find /var/log/nginx \
     -type f \
     -size -1G

# 3. Buscar archivos MAYORES a 2 Gigabytes
#
# - prefijo (+): actúa como el operador relacional > "mayor que .."
find /var/log/nginx \
     -type f \
     -size +2G

# 4. Buscar archivos entre 50 y 100 Megabytes
find /var/log/nginx \
     -type f \
     -size +50M \
     -size -100M

# ..............................................
# EJEMPLOS: BUSCAR ARCHIVOS + EJECUTAR COMANDOS
# ..............................................

# 1. Borrar archivos que coincidan con un patrón (Ej. *.log) en "todos los subdirectorios"
#
# - opción (-exec): va seguido de un comando que recibirá de parámetro cada archivo encontrado
# (ejecuta el comando asociado en cada archivo de forma individual, se ejecuta tantas veces como archivos encuentre el comando find)
#
# - el {} representa el archivo encontrado, similar a la opción -I de xargs
#
# - el ; hace de centinela, indica el fin de cada sentencia "comando + archivo encontrado"
# (Ej. rm --verbose archivo-1.txt; rm --verbose archivo-2.txt; rm --verbose archivo-3.txt; ...)
#
# - el ; requiere ser escapado con el slash invertido '\'
find /var/log/nginx \
     -name '*.log' \
     -exec rm --verbose {} \;

# alternativa "similar" al comando anterior para entender los {}
#
# - éste sólo "borra en el directorio actual"
# - el comando find borraría en "todos los subdirectorios" (a menos que usemos la opción -maxdepth)
ls /var/log/nginx/*.log | xargs -I {} rm --verbose {}

# 2. Cambiar el propietario de los archivos
# (Ej. pasamos de un servidor Apache a un servidor Nginx)
find /path/aplicacion-web \
     -type f \
     -user www-data \
     -exec chown nginx {} \;
