## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: contenedores y maquinas virtuales
## DESCRIPCION: empaqueta aplicaciones en contenedores similares a maquinas virtuales
##
## OBSERVACIONES: -
## ####################################################################

# eliminar todas las imagenes en desuso que son más antiguas a un número de horas
# (https://docs.docker.com/engine/reference/commandline/image_prune/)
docker image prune -a --force --filter "until=1h"
