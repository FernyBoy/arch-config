#!/bin/bash

# Verificamos si se ha proporcionado el nombre del archivo de texto
if [ $# -ne 1 ]; then
	  echo "Uso: $0 <nombre-del-archivo>"
	    exit 1
fi

# Creamos un archivo temporal para guardar los paquetes que no se hayan podido instalar
paquetes_no_instalados=$(mktemp)

# Leemos el archivo de texto y guardamos cada línea en una variable
while read line; do
	  # Verificamos si la línea está vacía
	    if [ ! -z "$line" ]; then
		        # Eliminamos la versión del paquete especificado en la línea
			    paquete=$(echo "$line" | awk '{print $1}')
			        # Intentamos instalar el paquete utilizando pacman o yay según corresponda
				    if [[ $paquete == *"-bin" ]]; then
					          if ! yay -S "$paquete" --noconfirm; then
							          # Si yay no puede instalar el paquete, lo guardamos en el archivo temporal
								          echo "$paquete" >> "$paquetes_no_instalados"
									        fi
										    else
											          if ! sudo pacman -S "$paquete" --noconfirm; then
													          # Si pacman no puede instalar el paquete, lo guardamos en el archivo temporal
														          echo "$paquete" >> "$paquetes_no_instalados"
															        fi
																    fi
																      fi
															      done < "$1"

															      # Si el archivo temporal no está vacío, lo renombramos y lo movemos al directorio actual
															      if [ -s "$paquetes_no_instalados" ]; then
																        mv "$paquetes_no_instalados" "notInstalled.txt"
															      fi

