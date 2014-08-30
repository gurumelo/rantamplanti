# Rantamplanti
## Script para ejecutar script simultáneamente(de una sola vez) sobre un conjunto de máquinas/contenedores con ssh, o tostadoras, lavadoras, frigoríficos y otros electrodomésticos con ssh
                           _,.
                        ,''   `.     __....__ 
                      ,'        >.-''        ``-.__,)
                    ,'      _,''           _____ _,'
                   /      ,'           _.:':::_`:-._ 
                  :     ,'       _..-''  \`'.;.`-:::`:. 
                  ;    /       ,'  ,::'  .\,'`.`. `\::)`  
                 /    /      ,'        \   `. '  )  )/ 
                /    /      /:`.     `--`'   \     '`
                `-._/      /::::)             )
                   /      /,-.:(   , _   `.-' 
                  ;      :(,`.`-' ',`.     ;
                 :       |:\`' )      `-.._\ _
                 |         `:-(             `)``-._ 
                 |           `.`.        /``'      ``:-.-__,
                 :           / `:\ .     :            ` \`-
                  \        ,'   '}  `.   |
               _..-`.    ,'`-.   }   |`-'    
             ,'__    `-'' -.`.'._|   | 
                 ```--..,.__.(_|.|   |::._
                   __..','/ ,' :  `-.|::)_`.
                   `..__..-'   |`.      __,' 
                               :  `-._ `  ;
                                \ \   )  /
                                .\ `.   /
                                 ::    /
                                 :|  ,'
                                 :;,' SSh
                                 `'

## Estructura de archivos, directorios, convenciones y explicaciones
##### Bajando
	apt-get install git
	git clone https://github.com/gurumelo/rantamplanti.git
	cd rantamplanti
	ls
	r.sh maquinas.array plantis/

**r.sh** 
######Es el script que ejecuta las plantillas/scripts, admite como parámetro el nombre del directorio de la plantilla/script
**maquinas.array** 
######Es un archivo con un array, con elementos apuntando a cada máquina sobre la que quieras actuar
**plantis/** 
######Directorio que contiene las plantillas/scripts que serán ejecutados en las máquinas especificadas en maquinas.array

## Reuniendo máquinas
####Probándolo en local
	apt-get install ssh
#####Instalamos el metapaquete ssh que hace referencia al cliente ssh y al servidor ssh
#####Abrimos maquinas.array e introducimos, en este caso, la única máquina sobre la que se quiere actuar
######El nombre del array siempre debe ser, maquinas
	nano maquinas.array
	maquinas=(
        	"127.0.0.1"
	)
######Y guardamos

##Ejecución
#####Para ver las plantillas/scripts disponibles
	ls plantis
	apt  convars
#####Nos decidimos por uno de ellos y lo pasamos como primer parámetro a r.sh
	./r.sh apt
#####De este modo se habrá ejecutado el script apt, sobre la única máquina que hemos definido en maquinas.array

##Ejecutando plantilla/script simple sobre más de una máquina
#####Añadimos más referencias a máquinas dentro de maquinas.array. Pueden ser ip's, hosts, usuaria@ip/host, usuaria@ip/host -p XXXX; en el caso de que el servidor ssh de esa máquina no opere en el puerto 22... posibilidades
	nano maquinas.array
	maquinas=(
		'127.0.0.1'
		'root@192.168.1.69 -p 867'
	)
#####Y ejecutamos. El script se aplicará en las dos máquinas/contenedores, o tantas como definamos en el array
	./r.sh apt


##Script sin constantes para cada máquina
#####Hasta ahora hemos ejecutado el script 'apt', primero sobre una máquina local, luego sobre local y una remota. Es un script simple.
Sin constantes diferentes para cada máquina, en un script común pueden usarse variables dentro de script.sh, siempre y cuando éstas se amolden a la situación de todas las máquinas.
En el último punto se ve como crear plantillas/scripts.

	ls plantis
	cd plantis/apt
	ls
	script.sh

Por convención el script principal de una plantilla, siempre se llamará script.sh. Ahí escribimos las acciones a ejecutar y poco más que reseñar

##Plantilla/script con constantes para cada máquina
#####Puede darse el caso que queramos pasar a un script constantes diferentes para cada máquina, por ejemplo, queremos crear un archivo en cada una de ellas pero que se llamen diferente según la máquina.
Como ejemplo de ello existe la plantilla convars

	ls plantis
	cd plantis/convars
	ls
	convars.csv script.sh

Nuevamente aparece script.sh, la plantilla principal siempre se llama script.sh. Ahí escribimos las órdenes. Y convars.csv, ahí irán las constantes que queramos para cada máquina.
Cada línea/registro de convars.csv, siempre debe llamarse así el nombre del archivo de las constantes, convars.csv, convars.csv, convars.csv;... cada línea hace referencia al conjunto de constantes para una máquina, 1 línea de convars.csv se aplicará al primer elemento del array máquinas, segunda línea, será el conjunto de constantes que se aplican a script.sh y se ejecuta sobre la segunda máquina del array máquinas, así sucesivamente. Tantas líneas en convars.csv como máquinas tengamos. Cada constante se separa con ,, el separador, si quiere usar otro, puede definirlo en r.sh.

#####Si usted se pone a escribir una plantilla para más de una máquina, no piense mucho en esta chapuza. Escriba script.sh como si lo hiciese para una sola máquina y cada vez que se encuentre ante algo que será una constante diferente para cada máquina escriba $VAR1, $VAR2, $VAR3 y así sucesivamente, usando como convención $VARX, siendo X un número correlativo, empezando en 1 y tendiendo hacia "un círculo que se expande hacia el infinito es una línea?"

Ejemplificado en gráfica de coordenadas, equivaldría a:

				$VAR1   |  $VAR2 | $VAR3
	máquina1 →	consta1,,consta2,,conta3
	máquina2 →	otrab1,,otrab2,,otrab3
	máquina3 →	hamc1,,hamc2,,hamc3

######Quedando convars.csv así

	consta1,,consta2,,conta3
	otrab1,,otrab2,,otrab3
	hamc1,,hamc2,,hamc3


##Creación de plantillas/scripts

###Script simple
	cd plantis
	mkdir soyunaplantilla
	cd soyunaplantilla
	nano script.sh
		uptime
	cd ..
	cd ..
	./r.sh soyunaplantilla

#####De esta forma creamos un script simple. Dentro del directorio plantis/ creamos un directorio con el nombre que queramos dar. mkdir soyunaplantilla. Lo puedes complicar tanto como quieras.

Entramos dentro del directorio creado. cd soyunaplantilla. 
Creamos el archivo script.sh por convención y dentro de el, ponemos una orden simple, por probar. uptime. Que devuelve el tiempo que la máquina/s lleva encendida. Guardamos,
nos situamos de nuevo sobre la raiz de rantamplanti y ejecutamos con. ./r.sh soyunaplantilla Y hará efecto sobre las máquinas que tengamos en el array maquinas de maquinas.array

###Script/plantilla con constantes	
####Escribe una sola plantilla, ejecuta en muchas máquinas
	cd plantis
	mkdir plantillaconstante
	cd plantillaconstante
	nano script.sh
		echo "$VAR1" >> $VAR2
	nano convars.csv
		contenido1,,archivo1
		contenido2,,archivo2
	cd ../..
	./r.sh plantillaconstante

##### Entramos dentro de plantis y creamos el directorio plantillaconstante. Entramos dentro de plantillaconstante.

Creamos script.sh y escribimos el script como vayamos imaginando, cada vez que requieras de una constante específica para cada máquina, simplemente, comience con *$VAR1* , y así sucesivamente
cada vez que lo requiera *$VAR2* *$VAR3* ...

Los valores de esas marcas irán en convars.csv . Recordando. Una línea = un conjunto de valores para una máquina , Primera columna = $VAR1 , Segunda columna = $VAR2 ...
Y ejecutamos... 


####Futuribles
- crear script de generación de llaves ssh
- crear repositorio específico de plantillas





