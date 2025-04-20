#!/bin/bash
# Ejercicio 1.3 - Alex Dauria

# Mostramos cada parametro
echo "El parámetro \$1 es: $1"
echo "El parámetro \$2 es: $2"
echo "El parámetro \$3 es: $3"
echo "El parámetro \$4 es: $4"
echo "El parámetro \$5 es: $5"
echo "El parámetro \$6 es: $6"
echo "El parámetro \$7 es: $7"
echo "El parámetro \$8 es: $8"
echo "El parámetro \$9 es: $9"

# Mostramos el número total de parámetros
echo "Número total de parametros: $#"

# Mostramos todos los parámetros concatenados
echo $*

# Mostramos el nombre del archivo del script
echo "El nombre del archivo es $0"

