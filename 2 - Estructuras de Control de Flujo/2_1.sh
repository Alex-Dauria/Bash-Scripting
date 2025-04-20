#!/bin/bash
# Ejercicio 2.1 - Alex Dauria

# Pedimos la nota al usuario
read -p "Introduzca la nota numérica: " nota

# Verificamos que lo ingresado sea un número positivo
if ! [[ $nota =~ ^[0-9]+$ ]]; then 
    echo "Por favor, introduce un número válido." 

# Una vez corroborado, ingresamos la salida esperada dependiendo la entrada
else
    if [[ $nota -ge 9 ]]; then
        echo "Sobresaliente"
    elif [[ $nota -ge 7 && $nota -lt 9 ]]; then
        echo "Notable"
    elif [[ $nota -eq 6 ]]; then
        echo "Bien"
    elif [[ $nota -eq 5 ]]; then
        echo "Suficiente"
    else
        echo "Insuficiente"
    fi
fi

