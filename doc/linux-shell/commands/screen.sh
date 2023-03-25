## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: terminal de linux
## DESCRIPCION: multiplexor de terminales (crear multiples instancias de terminal en una sesión)
##
## OBSERVACIONES: -
## ####################################################################

# Crear una sesión con nombre
screen -S nombre

# Listar sesiones
screen -ls

# Vincular una sesión (por nombre ó id) a la terminal actual
screen -r nombre

# Cerrar una sesión
screen -X -S nombre quit
