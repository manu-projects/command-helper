## ####################################################################
## ACTUALIZADO: 25/03/2023
##
## CATEGORIA: fecha y hora del sistema
## DESCRIPCION: obtener una fecha ó formatear una fecha
##
## OBSERVACIONES: agrupamos los comandos date, touch, find
## ####################################################################

# Crear un archivo que tenga de nombre la "fecha actual"
#
# - el símbolo (+) va seguido del formato de la fecha a imprimir en pantalla
# - si no utilizamos la opción --date del comando date, usará la fecha y hora actual
#
# formatos más comunes
# - %d número de día del mes (Ej. 01, 02, 03, ..)
# - %m número de mes (Ej. 01, 02, 03, ..)
# - %Y número de año (Ej. 2010, 2011, ...)
# - %T el tiempo en hora:minuto:segundo
touch syslog-$(date +"%d-%m-%Y-%T").log
touch syslog-`date +"%d-%m-%Y-%T"`.log

# Crear un archivo que tenga de nombre.. la "fecha de mañana" con el formato "dia-mes-año"
touch syslog-$(date --date "tomorrow" +"%d-%m-%Y-%T").log

# Crear un archivo que tenga de nombre.. la "fecha de ayer" con el formato "dia-mes-año"
touch syslog-$(date --date "yesterday" +"%d-%m-%Y-%T").log

# otras variantes
touch syslog-$(date --date "next monday" +"%d-%m-%Y-%T").log
touch syslog-$(date --date "next friday" +"%d-%m-%Y-%T").log
touch syslog-$(date --date "next year" +"%d-%m-%Y-%T").log
touch syslog-$(date --date "2 year" +"%d-%m-%Y-%T").log

# Crear múltiples archivos con una "fecha específica"
# (formato requerido un string de la forma "año-mes-dia")
touch --date "1990-12-29" {fisica,quimica,algebra}.txt

# Crear archivos con una "fecha del pasado"
touch --date "10 sec ago" trabajo-practico.txt
touch --date "10 min ago" trabajo-practico.txt
touch --date "yesterday" {fisica,quimica,algebra}.txt
touch --date "2 year ago" {fisica,quimica,algebra}.txt

# Crear archivos con una "fecha en el futuro"
#
# - es requisito que los dias de la semana deben estar en inglés
# - el día de la semana NO es sensible a las minúsculas ni mayúsculas
touch --date "tomorrow" trabajo-practico.txt
touch --date "next Friday" trabajo-practico.txt
touch --date "next monday" trabajo-practico.txt
touch --date "next year" trabajo-practico.txt
touch --date "2 year" trabajo-practico.txt

# Buscar los archivos entre un "rango de fechas"
#
# - la opción -newer del comando date se le adicionan las opciones (a), (m), (t)
# - combinaciones comunes -newermt -newerat
# - la opción -not se puede utilizar como complemento (negación)
#
# - opción (t): interpreta la referencia como el tiempo
# - opción (a): evalúa el tiempo de acceso de la referencia al archivo
# - opción (m): evalúa el tiempo de modificación de la referencia al archivo
find /home/jelou/Downloads -type f -newermt 2017-09-25 -not -newermt 2023-09-26

# Buscar los archivos con "tiempo de modificación" más reciente respecto "de la fecha de hoy"
#
# - recordar que el comando date, requiere la fecha como un string de la forma "año-mes-dia"
find /home/jelou/Downloads -type f -newermt $(date +"%Y-%m-%d")

# Buscar los archivos "desde la fecha actual hasta hace 2 años" con "tiempo de modificación más reciente"
find /home/jelou/Downloads -type f -newermt $(date --date "2 year ago" +"%Y-%m-%d")

# Buscar los archivos "de una fecha específica" con "tiempo de modificación más reciente"
find /home/jelou/Downloads -type f -newermt $(date +"1990-12-29")
