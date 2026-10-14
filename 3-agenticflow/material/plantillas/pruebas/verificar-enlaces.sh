#!/bin/sh
# Comprobación de la documentación: cada enlace a un archivo del repositorio
# lleva a un archivo que existe.
#
# Uso, desde la raíz del repositorio:
#   sh pruebas/verificar-enlaces.sh
# En Windows, en una terminal Git Bash.
#
# Revisa los enlaces de Markdown de la forma [texto](ruta) y [texto](<ruta>)
# en todos los .md del repositorio. No revisa los enlaces a internet (http,
# https, mailto), los que llevan a una sección del mismo archivo (#...) ni los
# que están dentro de código (un bloque ``` o un `fragmento`), que son ejemplos.

fallas=0
revisados=0
salto='
'

archivos=$(find . -path ./.git -prune -o -name '*.md' -type f -print | sort)

set -f
ifs_anterior=$IFS
IFS=$salto
for archivo in $archivos; do
  carpeta=$(dirname "$archivo")
  enlaces=$(awk '/^[[:space:]]*(```|~~~)/ { en_bloque = !en_bloque; next } !en_bloque' "$archivo" \
    | sed 's/`[^`]*`//g' \
    | grep -oE '\]\(<[^>]*>\)|\]\([^)<]*\)' \
    | sed -E 's/^\]\(<?//; s/>?\)$//; s/[[:space:]]+"[^"]*"$//; s/#.*$//' \
    | grep -vE '^(https?:|mailto:|$)' | sort -u)
  for ruta in $enlaces; do
    revisados=$((revisados + 1))
    case "$ruta" in
      /*) destino=".$ruta" ;;
      *)  destino="$carpeta/$ruta" ;;
    esac
    if [ ! -e "$destino" ]; then
      echo "  ✘ $archivo enlaza a $ruta, que no existe"
      fallas=$((fallas + 1))
    fi
  done
done
IFS=$ifs_anterior
set +f

echo
if [ "$revisados" -eq 0 ]; then
  echo "Resultado: ningún documento enlaza todavía a otro archivo del repositorio."
  exit 0
elif [ "$revisados" -eq 1 ] && [ "$fallas" -eq 0 ]; then
  echo "Resultado: el único enlace a un archivo del repositorio lleva a algo que existe."
  exit 0
elif [ "$fallas" -eq 0 ]; then
  echo "Resultado: los $revisados enlaces a archivos del repositorio llevan a algo que existe."
  exit 0
else
  echo "Resultado: $fallas de $revisados enlaces llevan a archivos que no existen."
  exit 1
fi
