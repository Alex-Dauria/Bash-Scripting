#!/bin/bash
# Ejercicio 2.4 - Alex Dauria

# Abrimos un ciclo for del 1 al 3, ya que son 3 intentos
for i in {1..3}; do
    read -p "¿Cuanto es 2 + 2?: " suma

# Si el usuario acierta, emitimos un mensaje de Correcto, clarificando cuantos intentos le tomó y salimos del programa
    if [[ $suma -eq 4 ]]; then
        echo "Correcto! Acertado en el intento $i"
        exit 0

# Si el usuario no acierta, emitimos un mensaje de Incorrecto, y avisamos cuantos intentos le quedan
    else
        intentos_left=$((3 - $i))
        if [[ $intentos_left -gt 0 ]]; then    
            echo "Incorrecto! Te quedan $intentos_left intentos."
        fi
    fi
done

# Si el usuario no acertó en 3 intentos, emitimos el mensaje de Juego finalizado
echo "Game Over"