BAT=bat $(METADATA_OBSERVACIONES) \
		--line-range $(LINE_METADATA_OBSERVACIONES):$(LINE_METADATA_OBSERVACIONES) \
		--highlight-line $(LINE_METADATA_OBSERVACIONES) \
		--line-range $(NUMBER_LINE_BEGIN_DOCUMENTATION):

EDITOR_NOTE=bat --line-range $(NUMBER_LINE_BEGIN_DOC_NOTES):

CONTENT_FIELD_SEPARATOR=|

CONTENT_HEADERS="Comando|Categoría|Descripción"
NAWK_HEADERS=nawk 'BEGIN{print $(CONTENT_HEADERS)} {print $$0}'
COLUMNS=column -t -s "|"

# en GNU Make debemos escapar el $ que utiliza awk para los parámetros por eso $$1 $$2 en vez de $1 ó $2,
# para que lo tome como un caracter y no lo tome una referencia a una macro de GNU Make
#
# (lo usamos para formatear el texto)
NAWK_ORDER_FIELDS=nawk -F '$(CONTENT_FIELD_SEPARATOR)' '{print $$1 " | " tolower($$2) " | " toupper(substr($$3,1,1)) substr($$3,2)}'

TRUNCATE_CLEAR_CONTENT=truncate -s 0

# luego es utilizado al listar los comandos por la segunda columna (categoria)
# Ej. cat comandos.txt | sort -t "|" -k 2
SORT_BY_COLUMN = sort -t '$(CONTENT_FIELD_SEPARATOR)' -k

COPY_NOT_OVERWRITE=rsync --ignore-existing
# alternativa al rsync --ignore-existing es cp --no-clobber

# - el $? NO es una macro de GNU Make, es propio de linux y guarda el Estado de Salida luego de ejecutar un comando de linux (programas)
EXIT_STATUS=$(shell echo $$?)

# - el valor 0 indíca que el comando de linux se ejecutó con éxito
# (se le pasaron opciones que posee, parámetros válidos como rutas, ...)
EXIT_STATUS_SUCCESS=0
