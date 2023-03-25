## CATEGORIA: control de versiones
## DESCRIPCION: registrar los cambios de estado de aplicaciones

# Cambiar el nombre de una rama (branch) del repositorio local (Ej. máquina de trabajo)
git branch --move nombre-actual nuevo-nombre
git branch -m nombre-actual nuevo-nombre

# Borrar una rama (branch) del repositorio remoto (Ej. github)
git push origin --delete nombre
