# Prueba Técnica 2 - Desarrollo de una Aplicación de Gestión de Turnos/Citas

## Descripción del Proyecto

El objetivo de esta aplicación es gestionar turnos o citas para una entidad gubernamental, donde los ciudadanos pueden sacar turnos para diferentes trámites. La aplicación permite la gestión de los turnos en base a su estado ("En espera" o "Ya atendido"), y está implementada utilizando Java, Servlets, JSP y JPA para el acceso a la base de datos.

## Requisitos Técnicos

- **Backend:** Desarrollado en **Java EE 7 Web** con **Servlets** para la lógica de negocio.
- **Frontend:** **JSP** para la interfaz de usuario. Utiliza plantillas y **Bootstrap** para el diseño, con **JavaScript Vanilla** para la interactividad.
- **Base de Datos:** Utiliza **JPA (Java Persistence API)** para interactuar con una base de datos MySQL.
- **Acciones CRUD:** Implementación de operaciones **Crear, Leer, Actualizar y Borrar** para gestionar los turnos.
- **Colecciones y Funciones Lambda:** Se utilizan colecciones para gestionar datos en memoria y funciones lambda/streams como complemento de la programación funcional.

## Funcionalidades de la Aplicación

1. **Agregar un nuevo turno/cita:** Los usuarios pueden ingresar un nuevo turno, incluyendo número, fecha, descripción del trámite y asignación a un ciudadano. Un ciudadano puede tener múltiples turnos.

2. **Listar turnos:** Los usuarios pueden visualizar todos los turnos con los ciudadanos asignados, en base a una fecha proporcionada.

3. **Filtrado de turnos:** Los usuarios pueden filtrar los turnos por su estado (En espera o Ya atendido).

4. **Login de usuario:** Implementación de un login para acceder a la aplicación, donde el usuario debe iniciar sesión antes de interactuar con el sistema. 
   - **Usuario:** `admin`
   - **Contraseña:** `admin123`

5. **Acceso a PhpMyAdmin:** 
   - **Usuario:** `admin`
   - **Contraseña:** `123`

## Requisitos Técnicos

- **Java Version:** 1.7
- **Apache Tomcat Version:** 7.0 (Utilizado para desplegar la aplicación)
- **JPA Version:** 2.7.10
- **Maven Dependencies:** 
  - JSTL
  - MySQL Connector/J
  - EclipseLink (JPA)

## Instalación y Ejecución

### 1. Clonar el Repositorio

```bash
git clone https://github.com/<usuario>/<repositorio>.git
```

### 2. Configuración de la Base de Datos

1. Asegúrate de tener **MySQL** instalado y en funcionamiento.
2. Crea una base de datos para la aplicación:
   ```sql
   CREATE DATABASE turnos;
   ```
3. Configura el archivo `persistence.xml` para conectar tu aplicación a la base de datos MySQL.

### 3. Ejecutar la Aplicación

1. Abre el proyecto con un IDE compatible con Maven (por ejemplo, IntelliJ IDEA o Eclipse).
2. Usa Maven para compilar el proyecto:
   ```bash
   mvn clean install
   ```
3. Despliega el archivo WAR generado en **Apache Tomcat**.

### 4. Acceder a la Aplicación

- Inicia el servidor Apache Tomcat.
- Accede a la aplicación a través del navegador:
  ```url
  http://localhost:8080/Prueba_Turnero
  ```

### 5. Iniciar sesión

- **Usuario:** `admin`
- **Contraseña:** `admin123`

### 6. Acceder a PhpMyAdmin

- **URL:** `http://localhost/phpmyadmin`
- **Usuario:** `admin`
- **Contraseña:** `123`

## Estructura del Proyecto

- **src/main/java:** Contiene el código fuente de la aplicación (Servlets, lógica de negocio).
- **src/main/webapp:** Contiene las vistas JSP y otros recursos estáticos (CSS, JS).
- **src/main/resources:** Contiene archivos de configuración, como `persistence.xml`.

## Supuestos

1. **Base de Datos:** Se ha utilizado MySQL como motor de base de datos.
2. **Autenticación:** El login es simple, con credenciales predefinidas.
3. **Entidades:** Se ha supuesto que las entidades `Turno` y `Ciudadano` ya están definidas con sus respectivas relaciones en la base de datos.

## Extras

- Se ha implementado un filtro para asegurar que los usuarios no puedan acceder a páginas sin haber iniciado sesión.
- El código utiliza programación funcional con **streams y funciones lambda** para mejorar la eficiencia y optimización de las consultas.

## Tecnologías Utilizadas

- **Java EE 7 Web**
- **JSP (JavaServer Pages)**
- **JPA (Java Persistence API)**
- **Servlets**
- **MySQL**
- **Bootstrap**
- **JavaScript Vanilla**
- **Apache Tomcat 7.0**

---

### ¡Disfruta de la aplicación!

```

