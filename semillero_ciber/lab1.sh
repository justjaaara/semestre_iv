#!/bin/bash

# Crear directorio principal para el laboratorio
LAB_DIR="$HOME/lab_linux"
mkdir -p "$LAB_DIR"
echo "Directorio principal del laboratorio creado en: $LAB_DIR"

# Crear niveles
for i in {1..15}; do
  LEVEL_DIR="$LAB_DIR/nivel_$i"
  mkdir -p "$LEVEL_DIR"
  echo "Nivel $i creado en: $LEVEL_DIR"
done

# Nivel 1 - Objetivo: Listar archivos
LEVEL_1="$LAB_DIR/nivel_1"
touch "$LEVEL_1/archivo1.txt"
touch "$LEVEL_1/archivo2.txt"
touch "$LEVEL_1/archivo3.txt"
echo "Bienvenido al Nivel 1. Lista los archivos dentro de esta carpeta." > "$LEVEL_1/README.txt"

# Nivel 2 - Objetivo: Mover archivos
LEVEL_2="$LAB_DIR/nivel_2"
touch "$LEVEL_2/mover.txt"
mkdir "$LEVEL_2/destino"
echo "Tienes que mover el archivo 'mover.txt' al directorio 'destino'." > "$LEVEL_2/README.txt"

# Nivel 3 - Objetivo: Buscar dentro de archivos
LEVEL_3="$LAB_DIR/nivel_3"
echo "Busca la palabra 'encontrar' dentro de los archivos." > "$LEVEL_3/README.txt"
echo "Este es un texto sin nada especial." > "$LEVEL_3/documento1.txt"
echo "Tienes que encontrar esta línea: encontrar." > "$LEVEL_3/documento2.txt"
echo "Otro archivo vacío." > "$LEVEL_3/documento3.txt"

# Nivel 4 - Objetivo: Editar un archivo
LEVEL_4="$LAB_DIR/nivel_4"
echo "Edita el archivo 'editar.txt' y añade tu nombre." > "$LEVEL_4/README.txt"
echo "Este archivo está vacío. Debes añadir tu nombre." > "$LEVEL_4/editar.txt"

# Nivel 5 - Objetivo: Eliminar archivos
LEVEL_5="$LAB_DIR/nivel_5"
touch "$LEVEL_5/eliminar1.txt"
touch "$LEVEL_5/eliminar2.txt"
touch "$LEVEL_5/eliminar3.txt"
echo "Elimina todos los archivos '.txt' de este directorio." > "$LEVEL_5/README.txt"

# Nivel 6 - Objetivo: Comprimir archivos
LEVEL_6="$LAB_DIR/nivel_6"
touch "$LEVEL_6/file1.log"
touch "$LEVEL_6/file2.log"
touch "$LEVEL_6/file3.log"
echo "Debes comprimir todos los archivos '.log' en un archivo zip llamado 'archivos.zip'." > "$LEVEL_6/README.txt"

# Nivel 7 - Objetivo: Cambiar permisos de archivos
LEVEL_7="$LAB_DIR/nivel_7"
touch "$LEVEL_7/script.sh"
chmod 000 "$LEVEL_7/script.sh"
echo "Cambia los permisos del archivo 'script.sh' para que sea ejecutable por el usuario." > "$LEVEL_7/README.txt"

# Nivel 8 - Objetivo: Contar líneas en un archivo
LEVEL_8="$LAB_DIR/nivel_8"
for i in {1..100}; do echo "Línea $i" >> "$LEVEL_8/lines.txt"; done
echo "Cuenta cuántas líneas tiene el archivo 'lines.txt'." > "$LEVEL_8/README.txt"

# Nivel 9 - Objetivo: Redirigir salida de comandos
LEVEL_9="$LAB_DIR/nivel_9"
echo "Crea un archivo con el listado de archivos de este directorio redirigiendo la salida del comando 'ls'." > "$LEVEL_9/README.txt"

# Nivel 10 - Objetivo: Buscar archivos modificados recientemente
LEVEL_10="$LAB_DIR/nivel_10"
touch "$LEVEL_10/oldfile.txt"
sleep 2
touch "$LEVEL_10/newfile.txt"
echo "Encuentra los archivos modificados en las últimas 24 horas." > "$LEVEL_10/README.txt"

# Nivel 11 - Objetivo: Procesar múltiples archivos con un solo comando
LEVEL_11="$LAB_DIR/nivel_11"
touch "$LEVEL_11/file1.txt"
touch "$LEVEL_11/file2.txt"
touch "$LEVEL_11/file3.txt"
echo "Renombra todos los archivos '.txt' en este directorio añadiendo el prefijo 'mod_'" > "$LEVEL_11/README.txt"

# Nivel 12 - Objetivo: Encontrar y eliminar archivos vacíos
LEVEL_12="$LAB_DIR/nivel_12"
touch "$LEVEL_12/empty1.txt"
touch "$LEVEL_12/empty2.txt"
echo "Encuentra y elimina todos los archivos vacíos en este directorio." > "$LEVEL_12/README.txt"

# Nivel 13 - Objetivo: Crear un enlace simbólico
LEVEL_13="$LAB_DIR/nivel_13"
touch "$LEVEL_13/original.txt"
echo "Crea un enlace simbólico de 'original.txt' llamado 'link_a_original.txt'." > "$LEVEL_13/README.txt"

# Nivel 14 - Objetivo: Buscar un patrón en múltiples archivos
LEVEL_14="$LAB_DIR/nivel_14"
echo "Este archivo contiene el patrón." > "$LEVEL_14/file1.log"
echo "Este archivo no lo contiene." > "$LEVEL_14/file2.log"
echo "Este también contiene el patrón." > "$LEVEL_14/file3.log"
echo "Encuentra qué archivos contienen la palabra 'patrón'." > "$LEVEL_14/README.txt"

# Nivel 15 - Objetivo: Crear un script de backup automático
LEVEL_15="$LAB_DIR/nivel_15"
mkdir "$LEVEL_15/original_files"
touch "$LEVEL_15/original_files/file1.txt"
touch "$LEVEL_15/original_files/file2.txt"
echo "Escribe un script que copie todos los archivos del directorio 'original_files' a un nuevo directorio 'backup'." > "$LEVEL_15/README.txt"

echo "Laboratorio con 15 niveles creado con éxito."
