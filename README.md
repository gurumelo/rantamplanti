# Rantamplanti
## Script para ejecutar script(de una sola vez) sobre un conjunto de contenedores LXC con ssh, o tostadoras, lavadoras, frigoríficos y otros electrodomésticos con ssh
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


## Ejecución

## Plantilla de scripts sin variables

## Plantilla de scripts con variables fijas o dinámicas para cada máquina

## Escenario 1: Ejecutar sobre una sola máquina

## Escenario 2: Ejecutar sobre dos o más máquinas



