Las capas de la aplicación (por ejemplo capa de persistencia, vistas, red, negocio, etc) y qué clases pertenecen a cual:

Capa de persistencia: no tiene persistencia en disco, la persistencia es manejada por Alamofire en memoria, por lo que necesitas internet si quieres cerrar y abrir el app sin internet, dado a alguna complicaciones de URLCache, y que estoy ahorita en proceso de mudanza, preferí dejarlo de lado (Si es excluyente, puedo resolver el tema de URLCache para guardar las respuestas e imágenes en cache de disco, o usa el directorio de documentos del usuario para guardar la info)

Capa de vistas: está desarrollada con Storyboards y archivos Xib, dentro de la carpeta “Storyboards”

Capa de Negocio: recae en los archivos *ViewController, se mezcla con la de vista pues use el patron de arquitectura que apple entrega por defecto, que teóricamente es MVC aunque en el Controller se maneje la vista también. 

Capa de red: Manejada por Alamofire y el archivo Updater.swift el cual se encarga de encaminar las peticiones necesarias por la capa de negocio.


La responsabilidad de cada clase creada:

Updater.swift: se encarga de hacer y serializar/deserializar las peticiones de red y sus respuestas, recibiendo y entregándole a la capa de negocio objetos en el negocio entiende.
Las Extenions: Se encargan de extender otras classes originales de apple para agregarle funciones útiles para Moviesapp
Las *ViewController: Se encargan de la logica de negocio y presentacion, usan Updater.swift para pedir lo que debe mostrarse y lo muestra al usuario
Los Modelos: Movie, Genre, Video, ProductionCountry, ProductionCompany, SpokenLanguage, utilizados para representar los datos del negocio.
Reachability.swift: Encargada de determinar el estado de conexión del usuario a la red, se usan funciones estáticas para consultarlo.



En qué consiste el principio de responsabilidad única? Cuál es su propósito? Consiste en dejar a una clase cumplir una única función, el propósito es tener un codigo cómodamente mantenible, escalable sin mayores problemas y entendible. En mi proyecto incurro en una violacion de este principio al dejar la logica de negocio mezclada con la de presentación en los archivos viewControllers, pero es una practica estandarizada por los desarrolladores de Apple, existen otros patrones que respetan este principio como lo es el VIPER (no lo he usado, pero me interesa hacerlo en mis próximos proyectos)



Qué características tiene, según su opinión, un “buen” código o código limpio: hay varias practicas que hacen a un código limpio:

Lo mas importante esta en las funciones.
Un nombre que describa bien lo que hace la función
No duplicidad de código
Cortas
Evitar el uso de mas de un if else,
El coding debe expresar claramente lo que hace (hacer uso de programación funcional) Swift mejora su código en relación a esto en cada actualización.
Respetar las nomenclaturas de funciones y clases 


