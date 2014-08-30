# Rantamplanti
## Script para ejecutar script(de una sola vez) sobre un conjunto de máquinas/contenedores con ssh, o tostadoras, lavadoras, frigoríficos y otros electrodomésticos con ssh
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
#####Hasta ahora hemos ejecutado el script 'apt', primero sobre una máquina local, luego sobre local y una remota. Es un script simple,
sin constantes diferentes para cada máquina, en un script común pueden usarse variables dentro de script.sh, siempre y cuando éstas se amolden a la situación de todas las máquinas.
En el último punto se ve como crear plantillas/scripts.

	ls plantis
	cd apt
	ls
	script.sh

Por convención el script principal de una plantilla, siempre se llamará script.sh. Ahí escribimos las acciones a ejecutar y poco más que reseñar

##Plantilla/script con constantes para cada máquina
#####Puede darse el caso que queramos pasar a un script constantes diferentes para cada máquina, por ejemplo, queremos crear un archivo en cada una de ellas pero que se llamen
diferente según la máquina

##Creación de plantillas/scripts





