#!/bin/bash
# Ejercicio 6.1 - Gestión de usuarios - Alex Dauria

# Función para añadir un nuevo usuario
anadir_usuario() {
  echo -n "Nombre del usuario: "
  read nuevo_usuario

  # Verificamos si el usuario ya existe
  if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
  else
    # Si no existe, lo añadimos
    useradd "$nuevo_usuario" && echo "Usuario $nuevo_usuario añadido con éxito."
  fi
}

# Función para eliminar un usuario
eliminar_usuario() {
  echo -n "Nombre del usuario a eliminar: "
  read usuario_eliminar

  # Verificamos si el usuario existe
  if id "$usuario_eliminar" &>/dev/null; then
    # Si existe, lo eliminamos
    userdel -r "$usuario_eliminar" && echo "Usuario $usuario_eliminar eliminado con éxito."
  else
    echo "El usuario $usuario_eliminar no existe."
  fi
}

# Función para verificar si el usuario tiene privilegios de root
verificar_root() {
  if [[ "$(id -u)" -ne 0 ]]; then
    echo "No tiene permiso de administrador."
    return 1
  fi
  return 0
}

# Función para mostrar el menú de gestión de usuarios
mostrar_menu_gestion() {
  echo "Menú de gestión de usuarios"
  echo "A. Añadir"
  echo "E. Eliminar"
  echo "V. Volver"
  echo -n "Elige una opción: "
}

# Función para gestionar los usuarios (añadir, eliminar, etc.)
gestionar_usuarios() {
  while true; do
    mostrar_menu_gestion
    read opcion
    # Convertir la opción a minúsculas para ignorar mayúsculas y minúsculas
    opcion=$(echo "$opcion" | tr '[:upper:]' '[:lower:]')

    case "$opcion" in
      a) # Añadir usuario
        if verificar_root; then
          anadir_usuario
        fi
        ;;
      e) # Eliminar usuario
        if verificar_root; then
          eliminar_usuario
        fi
        ;;
      v) # Volver al menú principal
        return
        ;;
      *) # Opción no válida
        echo "Opción no válida, por favor elige de nuevo."
        ;;
    esac
  done
}

# Llamamos a la función para gestionar usuarios
gestionar_usuarios