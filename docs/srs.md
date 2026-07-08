𝐁𝐨𝐨𝐤𝐥𝐲
1. *Introducción*

Este documento describe los requisitos funcionales y no funcionales del sistema Bookly, una aplicación web que permite a los usuarios administrar sus lecturas, marcar libros como leídos y crear una lista de favoritos.

2 *Alcance*

Bookly permitirá a los usuarios:

Registrarse en el sistema.
Iniciar y cerrar sesión.
Consultar un catálogo de libros.
Buscar libros por título.
Marcar libros como leídos.
Agregar y eliminar libros de favoritos.
Visualizar sus listas de libros leídos y favoritos.
1.3 Definiciones
Usuario: Persona registrada que utiliza la aplicación.
Libro: Elemento del catálogo disponible para consultar.
Favoritos: Lista personalizada de libros preferidos.
Leídos: Lista de libros que el usuario ha marcado como leídos.

2 *Descripción General*
Perspectiva del producto

Bookly es una aplicación web que utiliza:

Frontend: HTML, CSS y JavaScript.
Backend: PHP.
Base de datos: MongoDB.
Control de versiones: GitHub.
2.2 Funciones del sistema
Registro de usuarios.
Inicio de sesión.
Cierre de sesión.
Consulta del catálogo.
Búsqueda de libros.
Agregar libros a favoritos.
Eliminar libros de favoritos.
Marcar libros como leídos.
Eliminar libros de la lista de leídos.
Visualización de listas personales.
2.3 Tipo de usuarios
Usuario registrado

Puede:

Registrarse.
Iniciar sesión.
Consultar el catálogo.
Buscar libros.
Agregar y eliminar favoritos.
Marcar libros como leídos.
Ver sus listas.
3. Requisitos Funcionales
RF-01 Registro de usuario

El sistema deberá permitir que un usuario cree una cuenta mediante nombre, correo electrónico y contraseña.

RF-02 Inicio de sesión

El sistema deberá autenticar al usuario utilizando correo electrónico y contraseña.

RF-03 Cierre de sesión

El sistema deberá permitir cerrar la sesión de forma segura.

RF-04 Catálogo de libros

El sistema deberá mostrar un catálogo con los libros disponibles.

RF-05 Búsqueda de libros

El sistema deberá permitir buscar libros por título.

RF-06 Favoritos

El sistema deberá permitir agregar y eliminar libros de la lista de favoritos.

RF-07 Libros leídos

El sistema deberá permitir marcar y desmarcar libros como leídos.

RF-08 Perfil

El sistema deberá mostrar las listas personales de favoritos y libros leídos del usuario.

4. Requisitos No Funcionales
RNF-01 Rendimiento

El sistema deberá responder a las solicitudes en menos de 3 segundos.

RNF-02 Seguridad

Las contraseñas deberán almacenarse cifradas y el acceso a las funciones personales requerirá autenticación.

RNF-03 Disponibilidad

El sistema deberá estar disponible durante el horario de uso esperado por los usuarios.

RNF-04 Usabilidad

La interfaz deberá ser intuitiva, sencilla y adaptable a dispositivos móviles y de escritorio.

RNF-05 Compatibilidad

La aplicación deberá funcionar en los navegadores Google Chrome, Microsoft Edge y Mozilla Firefox.

RNF-06 Mantenibilidad

El código deberá estar organizado en módulos y documentado para facilitar futuras actualizaciones.

5. Casos de Uso
CU-01 Registrar usuario

Actor: Usuario

Flujo principal:

El usuario selecciona "Registrarse".
Ingresa sus datos.
El sistema valida la información.
Se crea la cuenta.
Se muestra un mensaje de registro exitoso.
CU-02 Iniciar sesión

Actor: Usuario

Flujo principal:

El usuario introduce su correo y contraseña.
El sistema valida las credenciales.
Se concede el acceso al catálogo.
CU-03 Agregar a favoritos

Actor: Usuario

Flujo principal:

El usuario selecciona un libro.
Presiona "Agregar a favoritos".
El sistema guarda el libro en su lista.
CU-04 Marcar libro como leído

Actor: Usuario

Flujo principal:

El usuario selecciona un libro.
Presiona "Marcar como leído".
El sistema agrega el libro a la lista de leídos.
6. Modelo de Datos
Colección: Usuarios
Campo	Tipo
_id	ObjectId
nombre	String
correo	String
contraseña	String
favoritos	Array
leidos	Array
Colección: Libros
Campo	Tipo
_id	ObjectId
titulo	String
autor	String
genero	String
descripcion	String
imagen	String
7. Restricciones
El usuario debe iniciar sesión para acceder a sus listas personales.
No se permitirán correos electrónicos duplicados.
Solo los usuarios autenticados podrán agregar favoritos o marcar libros como leídos.
8. Criterios de Aceptación
El usuario puede registrarse correctamente.
El usuario puede iniciar y cerrar sesión.
El catálogo muestra los libros disponibles.
La búsqueda devuelve resultados relacionados con el título ingresado.
Los libros se agregan y eliminan correctamente de Favoritos.
Los libros pueden marcarse y desmarcarse como Leídos.
La información del usuario permanece almacenada en MongoDB.
9. Tecnologías
Frontend: HTML, CSS y JavaScript
Backend: PHP
Base de datos: MongoDB
Control de versiones: Git y GitHub
IDE recomendado: Visual Studio Code
