#!/bin/bash
# Ejercicio 3.2 - Alex Dauria

# Le pedimos al usuario que ingrese una extensión de archivo (.txt, .log, etc)
read -p "Ingrese una extensión de archivo (ej: .txt): " extension

# Buscamos en el directorio actual cualquier coincidencia que termine con lo escrito por el usuario
for archivo in *"$extension"; do

# Si se encuentra un archivo que termine con dicha extensión, mostramos los datos
    if [[ -e $archivo ]]; then
        echo "Extensión del archivo: $extension"
        echo "Nombre del archivo: $archivo"
        echo "Contenido del archivo: "
        cat $archivo
        echo # Dejamos un 'echo' vacío para evitar que se escriba en la misma línea de algunos archivos
        echo "==========================================="
# Si no se encuentra un archivo que coincida, emitimos un mensaje avisando que no se ha encontrado
    else
        echo "No se encontraron archivos con la extension '$extension'"
    fi
done