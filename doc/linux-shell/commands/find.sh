## ####################################################################
## ACTUALIZADO: 25/03/2023
##
## CATEGORIA: listar archivos y directorios
## DESCRIPCION: buscar archivos por nombre, tipo, tamaño ó fecha
##
## OBSERVACIONES: en la doc del comando date, hay más ejemplos
## ####################################################################

# Buscar archivos de texto plano (coincidan con el patrón '*.txt') en "todos los subdirectorios"
#
# - opción (-type): el tipo de archivo.. (f) archivo común, ó (d) directorio, ó (l) softlink
# - opción (-maxdepth): si NO especificamos el nivel de profundidad, buscará en TODOS los subdirectorios (todos los niveles)
find /home/jelou -type f -name '*.txt'

# Buscar archivos de texto plano (coincidan con el patrón '*.txt') en "un directorio"
#
# - opción (-maxdepth): máximo nivel de profundidad de directorios a buscar
find /home/jelou -type f -name '*.txt' -maxdepth 1

# Buscar archivos en "todos los subdirectorios"
find /home/jelou -type f

# Buscar directorios y subdirectorios
find /home/jelou -type d

# Buscar archivos que coincidan con "un nombre específico"
#
# - opción (-name): el nombre del archivo, es sensible a mayúsculas/minúsculas
find /home/jelou -type f -name 'utils.c'

# Buscar archivos que coincidan "casi" con un nombre específico
#
# - opción (-iname): el nombre del archivo, NO es sensible (no distingue) a mayúsculas/minúsculas
# (podría encontrar utils.c, UTILS.c, Utils.c, ..)
find /home/jelou -type f -iname 'utils.c'

# Buscar archivos que NO coincidan con un nombre específico
#
# - opción (-not): niega la opción siguiente (Ej. -name, -iname, ...)
find /home/jelou -type f -not -name 'utils.c'

# Buscar archivos que tengan exactamente 10 Megabytes
#
# - opción (-size): tamaño del archivo seguido de la unidad (c) Bytes, (k) Kilobytes, (M) Megabytes, (G) Gigabytes
find /home/jelou -size 10M

# Buscar archivos MENORES a 1 Gigabytes
#
# - prefijo (-): actúa como el operador relacional < "menor que .."
find /home/jelou -size -1G

# Buscar archivos MAYORES a 2 Gigabytes
#
# - prefijo (+): actúa como el operador relacional > "mayor que .."
find /home/jelou -size +2G
