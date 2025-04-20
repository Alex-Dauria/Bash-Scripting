#!/bin/bash
# Ejercicio 4.1 - Alex Dauria

#Eliminamos cualquier archivo previo 
rm union.txt

# Abrimos un ciclo while que lee linea por linea el arch1.txt, incluyendo la última
while IFS=',' read -r equipo estadio || [ -n "$equipo" ]; do

# Limpiamos los saltos de línea extra o espacios al final de los valores utilizando | para conectar una salida con una entrada
    equipo=$(echo "$equipo" | tr -d '\r\n')
    estadio=$(echo "$estadio" | tr -d '\r\n')

# Buscamos coincidencias con el equipo, linea por linea en arch2.txt, luego cortamos en campos cada vez que haya un ; ignorando mayúsculas y minúsculas
# Y finalmente utilizamos el campo 1 (field1), que seria donde está el o los colores del equipo
    color=$(grep -i "$equipo" arch2.txt | cut -d';' -f1)

# Si el campo de color NO está vacio, es decir, que encontró una coincidencia
    if ! [[ -z $color ]]; then

# Convertimos todo a minúsculas primero
        equipo="${equipo,,}"
        color="${color,,}"
        estadio="${estadio,,}"

# Convertimos la primera letra de cada palabra a mayúscula
        equipo="${equipo^}"
        color="${color^}"
        estadio="${estadio^}"

# Escribimos los datos recibidos en el formato deseado en el nuevo archivo union.txt
        echo "[$equipo];[$color];[$estadio]" >> union.txt
    fi
done < arch1.txt