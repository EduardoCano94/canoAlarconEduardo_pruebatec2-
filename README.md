# canoAlarconEduardo_pruebatec2
Turnero: Sistema de gestión de citas
Descripción del proyecto
Este proyecto es una aplicación web de gestión de turnos/citas desarrollada en Java, utilizando Servlets, JSP, JPA y MySQL, diseñada para una entidad gubernamental para gestionar turnos ciudadanos.
Características principales

Gestión de turnos para diferentes trámites
Asignación de turnos a ciudadanos
Estados de turno: "En espera" y "Ya atendido"
Filtrado de turnos por fecha y estado
Sistema de autenticación de usuarios (Extra)

Requisitos previos

Java 7 o superior
Experto
MySQL
Servidor de aplicaciones compatible con Servlets (Tomcat recomendado)

Configuración del proyecto
Base de datos

Crear base de datos MySQL:

sqlCopiarCREATE DATABASE turnero_db;
USE turnero_db;

Configurar credenciales en persistence.xml:

xmlCopiar<property name="javax.persistence.jdbc.user" value="tu_usuario"/>
<property name="javax.persistence.jdbc.password" value="tu_contraseña"/>
Dependencias
El proyecto utiliza Maven. Las dependencias principales incluyen:

Conector MySQL
JPA (Persistencia del eclipse)
JSL (Lenguaje de señas japonés)
API de servlets

Instalación y ejecución

Clonar el repositorio

intentoCopiargit clone https://github.com/[tu-usuario]/[nombre-repositorio].git
cd [nombre-repositorio]

Compilar el proyecto

intentoCopiarmvn clean install

Desplegar en el servidor Tomcat


Copiar el WAR generado en target/el directorio webappsde Tomcat

Funcionalidades
Agregar turno

Permite crear nuevos turnos
Asignar un turno a un ciudadano específico
Estado inicial: "En espera"

Listar turnos

Visualización de turnos por fecha
Tabla detallada con información del turno y ciudadano

Filtrado de Turnos

Filtro por estado: "En Espera" o "Ya Atendido"

Consideraciones técnicas

Desarrollado con servlets Java
Frontend con JSP
Persistencia de datos con JPA
Uso de colecciones y streams
Implementación de inicio de sesión (extra)

Supuestos y notas

Un ciudadano puede tener múltiples turnos.
Los turnos son exclusivos por ciudadano
Se permite modificar el estado del turno.

Mejoras futuras

Implementación de validaciones más robustas
Mejora de la interfaz de usuario
Optimización de consultas con streams

Contribuciones
Las contribuciones son bienvenidas. Por favor, abre un problema o envía un pull request.
