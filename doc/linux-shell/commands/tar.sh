## ####################################################################
## ACTUALIZADO: 24/03/2023
##
## CATEGORIA: archivador
## DESCRIPCION: comprimir/descomprimir archivos y directorios
##
## OBSERVACIONES: -
## ####################################################################

# Extraer archivos en la ruta actual
#
# - (x) extract : extraer
# - (v) verbose: describe los pasos de forma verbosa
# - (f) file: especificar el archivo
tar -xvf videos-humor.tar
tar -xvf videos-humor.tar.gz

# Extraer archivos en una ruta específica
tar -xvf videos-humor.tar.gz -C ~/Videos/

# Comprimir archivo
#
# - (c): create: crear archivo
tar -cvf videos-humor.tar ~/Videos/humor

# Comprimir archivo con formato gzip
#
# (z): gzip: comprimir con gzip
tar -cvzf videos-humor.tar.gz ~/Videos/humor

# Filtrar archivos y no incluir los archivos con extensión .mp3
tar -cvzf videos-humor.tar.gz ~/Videos/humor --exclude=*.mp3

# Listar archivos
tar -tf videos-humor.tar

# Listar archivos con detalles
tar -tvf videos-humor.tar
