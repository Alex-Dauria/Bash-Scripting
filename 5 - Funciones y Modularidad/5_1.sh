#!/bin/bash
# Ejercicio 5.1 - Alex Dauria

# Función que recibe una línea (número) y extrae jugador y puntaje
lee_jugador_y_puntos() {
  local linea=$1
  IFS=',' read -r jugador puntaje <<< "$(sed -n "${linea}p" puntuaciones.txt)"
  echo "$jugador,$puntaje"
}

# Función para actualizar puntos y escribir en archivo temporal
actualizar_puntos() {
  local jugador=$1
  local puntosantiguos=$2
  local puntosnuevos=$3
  local total=$((puntosantiguos + puntosnuevos))
  echo "$jugador,$total" >> puntuaciones.temp
}

# Función para ordenar y mostrar el archivo final
ordenar_y_mostrar() {
  sort -t, -k2,2nr puntuaciones.txt > puntuaciones.ordenado
  mv puntuaciones.ordenado puntuaciones.txt
  cat puntuaciones.txt
}

# Función principal que gestiona todo
procesar_puntuaciones() {

    # Asegura que el archivo termine con un salto de línea
  sed -i -e '$a\' puntuaciones.txt
    # Borramos cualquier archivo temporal previo para asegurarnos de empezar limpio
  rm -f puntuaciones.temp

    # # Contamos el total de líneas en el archivo y recorremos cada línea con el ciclo for, pasando el número de línea a la función "lee_jugador_y_puntos"
  total_lineas=$(wc -l < puntuaciones.txt)
  for ((i=1; i<=total_lineas; i++)); do
    datos=$(lee_jugador_y_puntos "$i")
    IFS=',' read -r jugador puntaje <<< "$datos"

    # Si la línea está vacía, la salteamos
    [[ -z "$jugador" ]] && continue

    # Le pedimos al usuario que ingrese los puntos del jugador, y si no ingresa nada, se toma como un 0
    read -p "Puntos de $jugador: " extra </dev/tty
    [[ -z "$extra" ]] && extra=0

    # Si el usuario no ingresa un número entero positivo, también se toma 0 y se emite un mensaje
    if ! [[ "$extra" =~ ^[0-9]+$ ]]; then
      echo "  → No es un número entero positivo, tomo 0"
      extra=0
    fi

# Llamamos a la variable actualizar_puntos con los 3 parámetros conseguidos anteriormente
    actualizar_puntos "$jugador" "$puntaje" "$extra"
  done

    # Movemos el archivo temporal a puntuaciones.txt (sobreescribiendolo) y llamamos a la funcion ordernar_y_mostrar que los muestra en el orden deseado
  mv puntuaciones.temp puntuaciones.txt
  ordenar_y_mostrar
}

# Llamamos a la función que ejecuta todo
procesar_puntuaciones
