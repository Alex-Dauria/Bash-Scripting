#!/bin/bash
# Ejercicio 1.5 - Alex Dauria

# Le otorgamos el valor de los parámetros a las variables
num1=$1
num2=$2

# Si no introdujo ningun parámetro, preguntamos si quiere introducirlos ahora
if [[ $# -eq 0 ]]; then
    read -p "No ha introducido ninguno. ¿Quiere ahora s/n?: " rta

# Si escribe "s" otorgamos los nuevos valores a las variables num1 y num2
    if [[ $rta == "s" ]]; then
        read -p "Número 1: " num1
        read -p "Número 2: " num2

# Si introduce cualquier otro caracter, emitimos un mensaje y finalizamos el programa
    else
        echo "Hasta luego."
        exit 0
    fi 

# Si escribió solo 1, hacemos lo mismo pero asignando el nuevo valor solo a num2
elif [[ $# -eq 1 ]]; then
    read -p "Ha introducido uno. ¿Quiere ahora s/n?: " rta
    if [[ $rta == "s" ]]; then
        read -p "Número 2: " num2
    else
        echo "Hasta luego."
        exit 0
    fi

# Si introdujo más de 2 parámetros emitimos un mensaje y tomamos los primeros 2    
elif [[ $# -gt 2 ]]; then
    echo "Demasiados parámetros, tomo los dos primeros."

# Si introdujo 2, emitimos un mensaje
else
    echo "CORRECTO"
fi

# Si los parámetros introducidos no son números enteros, emitimos un mensaje y finalizamos el programa
if ! [[ $num1 =~ ^-?[0-9]+$ && $num2 =~ ^-?[0-9]+$ ]]; then
    echo "Error: ambos valores deben ser números enteros."
    exit 1
fi

# Realizamos las operaciones
suma=$(($num1 + $num2)) 
resta=$(($num1 - $num2))
multiplicacion=$(($num1 * $num2))


# Mostramos los resultados
echo "$num1 + $num2 = $suma" 
echo "$num1 - $num2 = $resta" 
echo "$num1 * $num2 = $multiplicacion" 

# Solo realizamos la división y mostramos el resultado si num2 es distinto a 0
if [[ $num2 -ne 0 ]]; then
    division=$(($num1 / $num2))
    echo "$num1 / $num2 = $division"
# Si es 0, mostramos un mensaje de error
else
    echo "Error: no se puede dividir por 0."
fi