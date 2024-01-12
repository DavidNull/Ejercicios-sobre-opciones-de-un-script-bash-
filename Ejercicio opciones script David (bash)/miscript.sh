#!/bin/bash
comprf=0
d="default/"
while getopts "t:o:d:" opt; do
	case "$opt" in
		t)
			t=${OPTARG}
			;;
		o)
			o=${OPTARG}
			;;
		d)
			d=${OPTARG}
			if [ -f $d ]; then
			comprf=1
			fi
			;;
		*)
			echo "Opción NO VÁLIDA, use -t (tipo), -o (origen), -d (destino)"
			;;
	esac
done

case "$t" in
	copiar)
		t="cp"
		;;
	mover)
		t="mv"
		;;
	borrar)
		t="rm -r"
		if [ $comprf -eq 0 ]; then
			echo "El parametro introducido en -d NO ERA UN FICHERO"
			echo "Saliendo..."
			exit 1
		fi
		;;
	*)
		echo "Opcion no valida :("
		;;
esac
#Ejecuto el comando
$t $o $d
