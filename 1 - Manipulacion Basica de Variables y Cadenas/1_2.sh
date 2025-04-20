#!/bin/bash
# Ejercicio 1.2 - Alex Dauria

# Pedimos un nombre de usuario
read -p "Introduce un nombre de usuario: " usuario

# Pedimos un mensaje
read -p "Introduce un mensaje: " mensaje

# Guardamos el mensaje en un archivo temporal
echo "$mensaje" > mensaje.txt

# Enviamos el mensaje al usuario especificado
write $usuario < mensaje.txt
