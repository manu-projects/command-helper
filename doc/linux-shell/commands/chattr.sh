## ####################################################################
## ACTUALIZADO: 12/04/2023
##
## CATEGORIA: operaciones sobre archivos
## DESCRIPCION: agregar protección de borrado y modificado
##
## OBSERVACIONES: agrupamos los comandos: chattr, lsattr
## ####################################################################

# Asociaciones para recordar los comandos:
# - (chattr) refiere a Change File Attributes
# - (lsattr) refiere a List File Attributes

# ....................................................................
# 1. Proteger un archivo (inmutabilidad, prohibe borrado/modificación)
# ....................................................................
#
# comando chattr
# - opción (+i): restringimos las operaciones de borrado/edición
# - opción (-i): removemos la protección de inmutabilidad
# - opción (-V): activa el modo verboso, describe las operaciones que hace (es V mayúscula)
#
chattr +i -V archivo.txt

# ..........................................................................
# 2. Permitir insertar texto a un archivo sin modificar contenido existente
# ..........................................................................
#
# comando chattr, opción (+a):
# - permite operaciones de inserción como el operador de redirección >>
# - prohibe operación de redirección > (porque borra el contenido y luego agrega)
# - prohibe que un editor de texto lo modifique
#
# comando chattr, opción (-a): removemos el flag (a)
#
chattr +a -V archivo.txt

# .........................................................................
# 3. Proteger un directorio de forma recursiva (archivos + subdirectorios)
# .........................................................................
#
# comando chattr
# - opción (-R): aplica la operación que usemos (+i, +a, -i, +a) a todos los archivos/subdirectorios
# - el NO uso de (-R): los archivos y subdirectorios quedan desprotegidos, se pueden modificar
#
chattr +i -V -R directorio/

# .....................................................
# 4. Listar archivos + flags de protección
# .....................................................

# - flag (i): protección de modificación/borrado
# - flag (a): protección de modificar contenido existente
lsattr
