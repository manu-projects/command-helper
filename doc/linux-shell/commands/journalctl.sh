## ####################################################################
## ACTUALIZADO: 27/03/2023
##
## CATEGORIA: registros del sistema
## DESCRIPCION: centraliza los registros del kernel, servicios, dispositivos, ...
##
## OBSERVACIONES: es el diario de systemd, requiere el demonio (daemon) systemd-journald ejecutando
## ####################################################################

# Comprobar que el servicio journald está ejecutando
systemctl status systemd-journald.service

# (alternativa al systemctl)
service systemd-journald status

# Listar todos los Servicios (ó unidades de systemd) con su estado
systemctl list-unit-files

# (alternativa al systemctl)
service --status-all

# ...............................
# EJEMPLOS: LOGS POR FECHA y HORA
# ...............................

# Ver logs de hoy
journalctl --since today

# Ver logs desde ayer
journalctl --since yesterday

# Ver logs desde ayer hasta una hora
journalctl \
    --since yesterday \
    --until '10:00'

# Ver logs desde una hora hasta hace una hora
journalctl \
    --since '09:00' \
    --until '1 hour ago'

# Ver logs entre un rango de fechas
# (Formato de las fechas absolutas debe ser YYYY-MM-DD HH:MM:SS)
journalctl \
    --since '2023-01-30 00:00' \
    --until  '2023-12-30 16:00'

# Otras combinaciones
journalctl --since '30 min ago'
journalctl --since '1 hour ago'
journalctl --since '1 day ago'
journalctl --since '1 week ago'

# ............................
# EJEMPLOS: LOGS POR PRIORIDAD
# ............................

# Ver logs por error
journalctl --priority=err
journalctl -p err

journalctl \
    --priority=err \
    --since '1 hour ago'

journalctl \
    --priority=err \
    --since yesterday

# Ver logs de alertas (warning)
journalctl --priority=warn
journalctl -p warn

# Ver logs críticos
journalctl --priority=crit
journalctl -p crit

# Otras variantes
journalctl \
    --priority=err \
    --boot=-0

journalctl \
    --priority=err \
    --boot=-0 \
    -k

# ...........................................................
# EJEMPLOS: LOGS POR Nº DE ARRANQUE, POR SERVICIO, DE KERNEL
# ...........................................................

# Ver log en tiempo real (registros recientes)
journactl --follow
journactl -f

# (alternativa al comando anterior)
tail -f /var/log/syslog

# Ver logs del Kernel
#
# - opción (--reverse): al no invertir el resultado, los más recientes estarán al final..
journalctl -k

# Ver logs del Kernel
#
# - opción (--reverse): invierte el resultado, los más recientes (últimos) estarán al principio
#
# - opción (--reverse) se puede combinar con otras opciones (--boot, --unit, --priority, ...)
journalctl --reverse -k
journalctl -r -k

# Listado de arranques (boot) con sus (IDs) identificadores numéricos y fechas
# - el 0 representa el arranque actual,
# - el -1, -2, -3, ... representan los arranques anteriores
journalctl --list-boots

# Ver logs de un número de arranque (ó en inglés BOOT) específico
#
# el 0 mostraría los registros del arranque actual
# el -2 mostraría los registros desde hace 2 arranques (del 0 al -2)
# el -3 desde hace 3 arranques (del 0 al -3)
# ...
journalctl --boot=0
journalctl -b 0

# Ver logs de kernel del último arranque (el actual)
#
# - agregar la opción (--reverse) si queremos al principio los registros más recientes del arranque
journalctl \
    --boot=0 \
    -k

journalctl \
    -b 0 \
    -k

# Ver logs de un Servicio específico (ó unidad de systemd)
# (Ej. docker, virtualbox, lightdm, ssh, ufw, network-manager, bluetooth, ..)
journalctl --unit=docker.service
journalctl -u docker.service

# intercalar registros entre Servicios conectados
journalctl --unit=nginx.service \
           --unit=php-fpm.service \
           --unit=mysql.service \
           --since today

# ...............
# OTROS EJEMPLOS
# ...............

# Ver logs del disco duro
journalctl /dev/sda
journalctl /dev/sda --priority=err
journalctl /dev/sda --since yesterday

# Ver logs en formato específico
# (por defecto utiliza el formato syslog)
journalctl /dev/sda --output=json

# (un json más humanizado)
journalctl /dev/sda --output=json-pretty
