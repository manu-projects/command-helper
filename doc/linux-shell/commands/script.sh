## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: terminal de linux
## DESCRIPCION: grabar la sesión de una terminal (stdin y stdout) en un archivo de texto ascii
##
## OBSERVACIONES: Agrupamos los comandos script, scriptreplay
## ####################################################################

# Grabar la sesión de la terminal actual
# - el atajo Ctrl + D finaliza la grabación (ó el comando exit)
#
# - opción --timing, crea otro fichero con información que reutilizará el comando scriptreplay
# para reproducir/emular la sesión de terminal con el mismo intervalo de tiempo entre comandos
script --timing=crear-usuarios-linux.timing.txt crear-usuarios-linux.log

script -t crear-usuarios-linux.timing.txt crear-usuarios-linux.log

# Agregar nueva información del stdin y stdout a una sesión de terminal grabada
script --append --timing=crear-usuarios-linux.timing.txt crear-usuarios-linux.log

# Reproducir (emula) en tiempo real una sesión grabada
scriptreplay --timing=crear-usuarios-linux.timing.txt --typescript crear-usuarios-linux.log

scriptreplay -t crear-usuarios-linux.timing.txt -s crear-usuarios-linux.log
