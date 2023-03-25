## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: operaciones con archivos y directorios
## DESCRIPCION: mover archivos y directorios
##
## OBSERVACIONES: -
## ####################################################################

# mover todos los archivos y directorios a un directorio, excluyendo el directorio destino
mv $(ls --ignore=apps/) apps/

# mover todos los archivos a una ruta excluyendo algunos directorios y archivos
mv $(ls --ignore=.git/ --ignore=.gitignore) nuevo-path/app
