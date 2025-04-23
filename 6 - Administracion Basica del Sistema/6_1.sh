#!/bin/bash
# Ejercicio 6.1 - Alex Dauria

# Función para mostrar el menú principal
mostrar_menu_principal() {
  echo "Menú de gestión de usuarios"
  echo "1. Información de usuario"
  echo "2. Gestión de usuario"
  echo "3. Salir"
  echo -n "Elige una opción: "
}

# Función para mostrar la información de un usuario
informacion_usuario() {
  echo -n "Introduce el nombre de usuario: "
  read usuario
  finger "$usuario" || echo "No se encontró información del usuario $usuario."
}

# Función para verificar si el usuario tiene privilegios de root
verificar_root() {
  if [[ "$(id -u)" -ne 0 ]]; then
    echo "No tiene permiso de administrador."
    return 1
  fi
  return 0
}

# Función para gestionar los usuarios (redirige al script20_gestion.sh)
gestionar_usuarios() {
  ./script20_gestion.sh
}

# Función principal que gestiona todo
procesar_opcion() {
  while true; do
    mostrar_menu_principal
    read opcion

    case "$opcion" in
      1) # Información de usuario
        informacion_usuario
        ;;
      2) # Gestión de usuario
        gestionar_usuarios
        ;;
      3) # Salir
        echo "Saliendo..."
        exit 0
        ;;
      *) # Opción no válida
        echo "Opción no válida, por favor elige de nuevo."
        ;;
    esac
  done
}

# Llamamos a la función principal
procesar_opcion
