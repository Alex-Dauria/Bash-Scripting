#!/bin/bash
# Ejercicio 2.5 - Alex Dauria

# Inicializamos la variable aciertos
aciertos=0

# Abrimos un ciclo while, que lee linea por linea y toma como pregunta lo que esta antes de ";" y como respuesta lo que esta despues
# Le agregamos un "OR" -n (si la cadena no está vacia). Para evitar errores en la última línea que no tiene salto de línea
while IFS=';' read -r pregunta respuesta || [ -n "$pregunta" ]; do

# Le realizamos la pregunta al usuario
    echo "Pregunta: $pregunta?"

# Leemos respuesta del usuario desde la terminal para evitar errores
    read -p "Respuesta: " respuesta_usuario < /dev/tty

# Comparamos las respuestas y sumamos 1 al contador de aciertos si fue correcta
    if [ "$respuesta_usuario" = "$respuesta_correcta" ]; then
        echo "¡Correcto!"
        ((aciertos++))

# Si no fue correcta, emitimos un mensaje con la respuesta correcta
    else
        echo "Incorrecto. La respuesta correcta es: $respuesta_correcta"
    fi

# Redirimos el archivo pregyresp.txt a la entrada del bucle para leer preguntas y respuestas
done < pregyresp.txt

# Mostramos el número total de aciertos
echo "Tienes $aciertos aciertos"