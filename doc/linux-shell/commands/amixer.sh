## ####################################################################
## ACTUALIZADO: 24/03/203
##
## CATEGORIA: audio
## DESCRIPCION: controla el volumen del sistema
##
## OBSERVACIONES: -
## ####################################################################

# Modificar el volumen principal al 50%
# (usar %+ y %- para incrementar y decrementar el valor actual)
amixer set Master 50%

# Subir el volumen principal en un 50%
amixer set Master 50%+

# Bajar el volumen principal en un 50%
amixer set Master 50%-

# Silenciar el volumen principal
amixer set Master mute

# Sacar el silencio del volumen principal
amixer set Master unmute

