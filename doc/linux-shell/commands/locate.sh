## ####################################################################
## ACTUALIZADO: 27/03/2023
##
## CATEGORIA: listar archivos y directorios
## DESCRIPCION: buscar archivos "en todo el sistema"
##
## OBSERVACIONES: difiere del comando find que busca en una ruta específica
## ####################################################################

# Buscar archivos/directorios que coincidan con ese patrón en "todo el sistema"
#
# - basename es el nombre del final de la ruta pueden ser archivos ó directorios
# (Ej. path/sub-path/basename path/basename)
locate --basename apache
locate -b apache

# Buscar archivos/directorios que coincidan con ese patrón en "todo el sistema"
locate .bashrc
locate apache
locate ngnix

# Direccionar el resultado de la búsqueda al comando less
# (por si el resultado de la búsqueda es muy largo, facilita la lectura)
locate apache | less

# Limitar el resultado de la búsqueda
locate apache --limit 10
locate apache -l 10

# - por default busca en la base de datos del sistema
# - opción -e ó --existing: si no se actualizó la db del sistema
# - la db del sistema se actualiza con el comando `updatedb`
locate --existing apache
locate -e apache

# Buscar archivos/directorios que coincidan con ese patrón, sin distinguir entre mayúsculas/minúsculas
# (Ej. podria encontrar Apache, apache, APACHE, ...)
locate --ignore-case apache
locate -i apache

# Contar cuantos archivos/directorios coinciden con ese patrón en "todo el sistema"
locate --count apache
locate -c apache

# Buscar archivos con expresiones regulares
locate --regex "(\.md|\.org)"
