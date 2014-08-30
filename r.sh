#!/bin/bash
# referencia al script a ejecutar, por convención, se pasa el nombre del directorio y el script se llamará script.sh

# Primer parámetro
script=plantis/$1
# separador de campos csv
separador=',,'

# Carga el array de máquinas
. ./maquinas.array


# si es una plantilla con conjuntos de variables csv para cada una, se opta por CSV porque indirección en bash es metafísica imposible.
if [ -f $script/convars.csv ]
then
	numerodelineas=$( wc -l < $script/convars.csv )
	numerodemaquinas=${#maquinas[@]}
	if [ $numerodelineas != $numerodemaquinas ]
	then
		
		echo -e "\e[94mEl número de conjuntos de variables($numerodelineas) en $script/convars.csv, no coincide con el número de máquinas($numerodemaquinas)"
		exit
	else
		incrementoregistro=1
		# Itera tantas veces como maquinas haya y también como líneas en convars.csv haya
		for maquina in "${maquinas[@]}"
		do
		
			echo -e "\e[94mAplicando $1 a $maquina"
			echo -e "\e[5m:)"

			# Iterar tantas veces como campos haya para hacer plantilla con sed
			cuantoscampos=$( awk -F ",," NR==$incrementoregistro'{ print NF }' $script/convars.csv )
			comandosed=''
			for (( i=1;i<=$cuantoscampos;i++ ))
			do
				sustituir=$( awk -v o=$i -F $separador NR==$incrementoregistro'{ print $o }' $script/convars.csv )
				por='$VAR'$i
				patron=" -e 's|$por|$sustituir|g'"
				comandosed+=$patron
			done
			# Parece que no hay más remedio que usar eval, sed no acepta argumentos como variables
			eval sed"$comandosed" "$script"/script.sh > "$script"/script"$incrementoregistro".sh

			# Precaución amigo conductor
			#ssh $maquina 'bash -s' < $script/script$incrementoregistro.sh

			echo -e "\e[92m$1 Aplicado a $maquina"
			echo -e "\e[95m###################################################"
			# Se incrementa incremento para leer siguiente conjunto de variables para la siguiente máquina
			#rm $script/script$incrementoregistro.sh
			let "incrementoregistro+=1"
		done
	fi

else
	# Iteración del array de máquinas y ejecución
	for maquina in "${maquinas[@]}"
	do
		echo -e "\e[94mAplicando $1 a $maquina"
		echo -e "\e[5m:)"
		ssh $maquina 'bash -s' < $script/script.sh
                echo -e "\e[92m$1 Aplicado a $maquina"
                echo -e "\e[95m###################################################"

	done
fi


# -Pendiente, generar un script rantamplanti que va generando llaves por las máquinas y trayéndoselas. Para que ssh si se quiere no pida claves
