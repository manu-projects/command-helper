## ####################################################################
## ACTUALIZADO: 28/03/2023
##
## CATEGORIA: crear archivos/directorios
## DESCRIPCION: crear archivos/directorios temporales aleatorios (únicos)
##
## OBSERVACIONES: útil para instalaciones ó realizar pruebas de comandos que listen archivos
## ####################################################################

# 1. Crear un archivo temporal aleatorio en la ruta /tmp
#
# - por default escribe en el STDOUT (pantalla) el nombre del archivo
# - por default los archivos se asignan permisos u+rw
mktemp

# 2. Crear un directorio temporal aleatorio en la ruta /tmp
# - por default los directorios se asignan permisos u+rwx
# - opción (--directory): aclara que NO quiere crear un archivo regular, si no un directorio
mktemp --directory
mktemp -d

# 3. Acceder a un directorio temporal aleatorio
# (éste es interesante para scripts de instalación, compilación, ..)
cd $(mktemp -d)

cd `mktemp -d`

# 4. Crear en una ruta específica un directorio aleatorio
# (al no estar en /tmp no se borrarán al apagar el OS, dependerá de nuestra aplicación)
mktemp \
    --directory \
    --tmpdir=/home/myapp/tmp

# 5. Crear archivos aleatorios con una extensión específica como sufijo (suffix)
mktemp --suffix=.txt
mktemp --suffix='.txt'

# 6. Crear archivos aleatorios con un nombre como plantilla
#
# - las X: representan la longitud del valor aleatorio, se sugiere un mínimo de tres
# (serán reemplazadas por caracteres alfanuméricos aleatorios)
mktemp alumno.XXX
mktemp alumno-XXX

mktemp alumno-XXX \
       --tmpdir=/home/myapp
