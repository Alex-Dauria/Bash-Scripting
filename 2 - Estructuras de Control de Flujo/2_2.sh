#!/bin/bash
# Ejercicio 2.2 - Alex Dauria

# Abrimos un ciclo while true para que se siga preguntando hasta que el usuario lo decida
while [[ true ]]; do
# Le ofrecemos las opciones al usuario
    echo "Introduzca una opción "
    read -p "(1) Calcular el área de un rectángulo. (2) Calcular el perímetro de un rectángulo. (3) Salir: " opcion

# Si escribe 3, salimos del loop con un exit
    if [[ $opcion == "3" ]]; then
        echo "Hasta luego..."
        exit 0

# Si escribe 1, pedimos base y altura, y calculamos el área 
    elif [[ $opcion == "1" ]]; then
        read -p "Base: " base
        read -p "Altura: " altura
        area=$(($base * $altura))
        echo "El área del rectángulo es: $area"

# Si escribe 2, pedimos base y altura, y calculamos el perímetro
    elif [[ $opcion == "2" ]]; then
        read -p "Base: " base
        read -p "Altura: " altura
        perimetro=$((2 * ($base + $altura)))
        echo "El perímetro del rectángulo es: $perimetro"

# Si escribe cualquier otra cosa, marcamos el error y el loop vuelve a comenzar
    else
        echo "Ingrese una opción valida"
    fi
done