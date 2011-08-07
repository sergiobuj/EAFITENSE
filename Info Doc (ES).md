# EAFITENSE Doc (ES)

La aplicación tiene gran parte de su configuración en el archivo 'Customization.plist' que se encuentra en
'EAFITENSE/EAFITENSE/Customization.plist'.

El archivo (un xml) tiene la siguiente estructura:

Llave			Valor
map_points		Arreglo de diccionarios con información de localización sobre edificios y puntos de interés en la universidad.
				Cada diccionario tiene título, subtitulo y la longitud y latitud del pin para un mapa.
				
rss_feeds		Diccionario que contiene las direcciones de los rss que se quieren consumir.
				La llave en cada una de estas entradas es el nombre del UIViewController que presentará esa información.

services		Diccionario que contiene la ubicación de los servicios a los que accederá el cliente.
				Para agregar servicios y funcionalidades se deben agregar en el archivo 'SBServiceCentral' ubicado en
				'EAFITENSE/EAFITENSE/Shared/SBServiceCentral' y en el diccionario services en el archivo 'Customization.plist'
				que se encuentra en 'EAFITENSE/EAFITENSE/Customization.plist'.
				
pages			Arreglo de arreglos de diccionarios. Cada arreglo contiene los elementos que se presentarán en cada pantalla de
				la aplicación (botones).
				Cada elemento está especificado como un diccionario que puede ser expandido para ofrecer mayor personalización.
				Las llaves principales son 'title'* y 'viewController'.

				* Todos los títulos y textos son localizados. Los títulos de los botones se deben especificar con la llave del archivo
				de localización correspondiente al texto del botón (ver archivos '.strings').


Para hacer uso del los servicios establecidos en el arreglo 'services' en el archivo 'Customization.plist' el controlador de la vista
debe implementar el protocolo de 'SBServiceCentralDelegate' que tiene la definición en 'SBServiceCentral.h'.

Cuando se agregan los botones en la pantalla principal se hace incrementando la distancia desde la barra de navegación.
Un una próxima versión se puede implementar un sistema de paginación que de acuerdo al número de botones definido por página se
agreguen a páginas siguientes.




# Servicios EAFIT
El cliente actualmente está consultando unos servicios expuestos por una aplicación RoR desplegada en Heroku y en CloudFoundry.
La aplicación RoR tiene simplemente la tarea de entregar un JSON con las caracteristicas e información relevante para aplicación
que tendría un servicio de EAFIT.
El método de inicio de sesión no se definió.