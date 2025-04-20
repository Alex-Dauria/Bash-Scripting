#!/bin/bash
# Ejercicio 1.4 - Alex Dauria

# Pedimos 2 cadenas de texto al usuario
read -p "Cadena 1: " cadena1
read -p "Cadena 2: " cadena2

# Revisamos si están vacias y emitimos el mensaje correspondiente
if [[ -z $cadena1 ]]; then
    echo "La cadena 1 está vacía"
else    
    echo "La cadena 1 no está vacía"
fi 
if [[ -z $cadena2 ]]; then
    echo "La cadena 2 está vacía"
else    
    echo "La cadena 2 no está vacía"
fi

# Revisamos si son iguales y emitimos el mensaje correspondiente
if [[ $cadena1 == $cadena2 ]]; then
    echo "Las dos cadenas son iguales"
else
    echo "Las dos cadenas son diferentes"
fi
