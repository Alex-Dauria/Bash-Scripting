#!/bin/bash
# Ejercicio 3.1 - Alex Dauria

# Le pedimos al usuario que ingrese la ruta del archivo
read -p "Ingrese una ruta de archivo: " ruta

# Primero verificamos si el archivo existe
if [[ -e $ruta ]]; then
    echo "Archivo: $ruta"
    echo "El archivo $ruta existe"

# Si es un archivo especial de bloques (-b)
    if [[ -b $ruta ]]; then
        echo "Es un archivo especial de bloques"

# Si es un archivo de caracteres (-c)
    elif [[ -c $ruta ]]; then
        echo "Es un archivo de caracteres"

# Si es un directorio (-d)
    elif [[ -d $ruta ]]; then
        echo "Es un directorio"

# Si es un archivo ordinario (-f)
    elif [[ -f $ruta ]]; then
        echo "Es un archivo ordinario"

# Si es un archivo simbólico (-h)
    elif [[ -h $ruta ]]; then
        echo "Es un archivo simbólico"
    fi

# Si tiene permiso de lectura (-r)
    if [[ -r $ruta ]]; then
        echo "Tiene permiso de lectura"
    fi

# Si tiene permiso de escritura (-w)
    if [[ -w $ruta ]]; then
        echo "Tiene permiso de escritura"
    fi
    
# Si tiene permiso de ejecución (-x)
    if [[ -x $ruta ]]; then
        echo "Tiene permiso de ejecución"
    fi  

# Si el archivo no existe, emitimos un mensaje
else
    echo "El archivo no existe."
fi
