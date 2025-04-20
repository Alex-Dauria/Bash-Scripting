#!/bin/bash
# Ejercicio 4.2 - Alex Dauria

# Abrimos un ciclo while para que el usuario pueda realizar diferentes tareas y elegir cuando salir
while [[ true ]]; do
    echo "Menú principal"

# Les damos las 3 opciones al usuario
    read -p "Ver club(1), Gestionar(2), Salir(3): " opcion

# Si el usuario escribe 3, sale del ciclo
    if [[ $opcion -eq 3 ]]; then
        break

# Si el usuario escribe 1, entra al menú de ver club
    elif [[ $opcion -eq 1 ]]; then
        echo "Ver club"

# Pedimos el nombre del Club y si encontramos coincidencia, imprimimos la línea completa con los datos
        read -p "Nombre del club: " club
        resultado=$(grep -i "$club" agenda.txt)
        if [[ -n "$resultado" ]]; then
            echo "$resultado"
# Si no se encuentra coincidencia, emitimos un mensaje al respecto
        else
            echo "No se encontró el club"
        fi

# Si el usuario escribió 2, abrimos un submenú con nuevas opciones
    elif [[ $opcion -eq 2 ]]; then
        echo "Gestionar"
        while [[ True ]]; do
            read -p "Insertar club(1), Eliminar club(2), Modificar(3), Salir(4): " opcion2

# Si el usuario ingresa 4, saldrá del submenú
            if [[ $opcion2 -eq 4 ]]; then
                break

# Si el usuario ingresa 1, entra a Insertar club
            elif [[ $opcion2 -eq 1 ]]; then
                echo "Insertar club"
                read -p "Ingrese el club: " club
                resultado=$(grep -i "$club" agenda.txt)

# Si NO encontramos una coincidencia, es decir que el club no existe, el usuario puede agregar el nuevo club               
                if  [[ -z $resultado ]]; then
                    read -p "Ingrese el nombre de su provincia: " provincia
                    read -p "Ingrese su localidad: " localidad
                    read -p "Ingrese su código: " codigo
                    echo "${club^^},${provincia^^},${localidad^^},${codigo^^}" >> agenda.txt
                else    
                    echo "El club ya existe"
                fi
# Si el usuario ingresa 2, entra a Eliminar club
            elif [[ $opcion2 -eq 2 ]]; then
                echo "Eliminar club"
                read -p "Ingrese el club: " club
                resultado=$(grep -i "$club" agenda.txt)

# Buscamos si el club existe
                if  [[ -n $resultado ]]; then

# Eliminamos la línea que tenga el nombre del club en el archivo y emitimos un mensaje
                sed -i "/$club/I d" agenda.txt
                    echo "El club ha sido eliminado con éxito"

# Si el club no existe, emitimos un mensaje
                else    
                    echo "El club no existe"
                fi

# Si el usuario ingresa 3, entra a Modificar
            elif [[ $opcion2 -eq 3 ]]; then
                echo "Modificar"
                read -p "Ingrese el club: " club
                resultado=$(grep -i "$club" agenda.txt)

# Si el club existe, eliminamos los datos que tenemos del mismo y pedimos los nuevos datos a insertar
                if  [[ -n $resultado ]]; then
                    sed -i "/$club/I d" agenda.txt
                    read -p "Ingrese el nombre de su provincia: " provincia
                    read -p "Ingrese su localidad: " localidad
                    read -p "Ingrese su código: " codigo
                    echo "${club^^},${provincia^^},${localidad^^},${codigo^^}" >> agenda.txt
                    echo "El club ha sido modificado con éxito"
# Si el club no existe, emitimos un mensaje
                else    
                    echo "El club no existe, por lo tanto, no puede ser modificado"
                fi
            else    
                echo "Por favor, ingrese una opción válida"
            fi
        done
    else
        echo "Por favor, ingrese una opción válida"
    fi 
done