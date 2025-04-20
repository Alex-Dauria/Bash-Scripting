#!/bin/bash
# Ejercicio 2.3 - Alex Dauria


# Creamos un ciclo while que le pide números al usuario
while [[ true ]]; do
    read -p "Número: " num
# Si el usuario NO ingresa un número, emitimos un mensaje pidiendo números válidos
    if ! [[ $num =~ ^-?[0-9]+$ ]]; then
        echo "Escribe un número válido"
    else
# Si el usuario ingresa un número que NO es 999, lo agregamos a nuestro archivo temporal
        if ! [[ $num -eq 999 ]]; then
            echo $num >> archivo.temporal
# Si el usuario ingresa 999, salimos del ciclo while
        else
            break
        fi
    fi
done

# Le preguntamos al usuario si quiere ver los números
read -p "¿Quieres ver los números introducidos? (s/n): " rta

while [[ true ]]; do
# Si responde que si (s), le preguntamos de qué forma quiere visualizarlos
    if [[ ${rta,,} == "s" ]]; then
        while ! ([[ ${rta2,,} == "o" ]] || [[ ${rta2,,} == "a" ]] || [[ ${rta2,,} == "d" ]]); do
            read -p "¿Orden de ingreso, ascendente o descendente? (o/a/d): " rta2

# Si ingresa (o), los mostramos simplemente en el orden ejecutado y salimos del while
            if [[ ${rta2,,} == "o" ]]; then
                echo "Orden de ingreso: "
                cat archivo.temporal
                echo "Hasta la vista"
                rm archivo.temporal
                exit 0

# Si ingresa (a), los mostramos de manera ascendente y salimos del while
            elif [[ ${rta2,,} == "a" ]]; then
                echo "Orden Ascendente: "
                sort -n archivo.temporal
                echo "Hasta la vista"
                rm archivo.temporal
                exit 0
# Si ingresa (d), los mostramos de manera descendente y salimos del while
            elif [[ ${rta2,,} == "d" ]]; then
                echo "Orden Descendente: "
                sort -nr archivo.temporal
                echo "Hasta la vista"
                rm archivo.temporal
                exit 0

            else
                echo "Opción no válida"
            fi
        done
# Si ingresó anteriormente "n", nos despedimos con un comentario y salimos del while
    elif [[ ${rta,,} == "n" ]]; then
        echo "Hasta la vista"
         rm archivo.temporal
        exit 0
# Si no ingresó S o N, emitimos un mensaje y pedimos que ingrese nuevamente
    else
        echo "Por favor, escriba S o N"
        read -p "¿Quieres ver los números introducidos? (s/n): " rta
    fi
done


