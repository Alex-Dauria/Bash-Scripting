#!/bin/bash
# Ejercicio 4.3 – Alex Dauria

# Inicializamos la variable nuevo
nuevo=""

# Iniciamos un ciclo while, leyendo linea por linea y tomando los datos de Jugador y Puntaje
while IFS=',' read -r jugador puntaje; do

# Si la línea está vacía, la salteamos
  [[ -z "$jugador" ]] && continue

# Le pedimos al usuario que ingrese el nuevo puntaje
# < /dev/tty fuerza a que read lea del teclado, para asi evitar problemas en diferentes plataformas
  read -p "Puntos de $jugador: " extra </dev/tty

# Si el usuario no ingresa nada, lo tomamos como un 0
  [[ -z "$extra" ]] && extra=0

# Si el usuario ingresa un caracter no numérico, tambien lo tomamos como un 0
  if ! [[ "$extra" =~ ^[0-9]+$ ]]; then
    echo "  → No es un número entero positivo, tomo 0"
    extra=0
  fi

# Sumamos el puntaje anterior con el nuevo puntaje a la variable total
  total=$((puntaje + extra))

# Pasamos a la variable nuevo los datos actualizados con el mismo formato de puntuaciones.txt
  nuevo+="$jugador,$total"$'\n'

done < puntuaciones.txt

# Escribimos el contenido de la variable ordenado por puntaje (descendente)
echo "$nuevo" | sort -t, -k2,2nr > puntuaciones.txt

# Mostramos la lista de jugadores ordenada de mayor a menor puntuación
cat puntuaciones.txt