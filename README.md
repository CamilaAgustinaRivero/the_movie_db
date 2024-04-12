# Challenge

<p align="center">
    <img width="120" src="https://img.shields.io/badge/STATUS-EN%20DESAROLLO-green">
</p>

## Descripción
Aplicación desarrollada en Flutter. Ofrece un listado de películas separadas en secciones.

## Arquitectura
El proyecto implementa una arquitectura DDD. El objetivo es separar la lógica de negocio y la lógica de presentación, lo que facilita el mantenimiento y escalabilidad a largo plazo.

## Características
- **Top 5 Aleatorio:** Sección en la Home. Muestra un conjunto aleatorio de las cinco películas más populares.
- **Más populares:** Sección en la Home. Muestra un listado de las películas más populares.
- **Mejores calificadas:** Sección en la Home. Muestra un listado de las películas mejores calificadas por los usuarios.
- **Próximos estrenos:** Sección en la Home. Muestra un listado de las próximas películas a estrenar.
- **Detalle de película:** Nueva pantalla. Muestra el detalle para cada película cliqueada desde la Home.

## Instalación
- Crear una cuenta en <a href="https://developer.themoviedb.org/docs/getting-started" target="_blank" rel="noreferrer">TMDB</a> y obtener la API key.
- Crear un archivo .env a partir del archivo .env-example.
- Instalar dependencias con el siguiente comando: flutter pub get
- Ejecutar la aplicación en un emulador o navegador.

## Dependencias
El proyecto utiliza las siguientes dependencias:
- **flutter_dotenv:** ^5.1.0
  - Descripción: Permite el manejo de las variables de entorno desde un archivo `.env`.
- **flutter_riverpod:** ^2.5.1
  - Descripción: Un paquete para gestión de estado que permite el manejo del estado de la aplicación.
- **go_router:** ^13.2.2
  - Descripción: Un router para Flutter que facilita la navegación dentro de la aplicación.
- **intl:** ^0.19.0
  - Descripción: Proporciona soporte para internacionalización y localización de la aplicación.

Camila A. Rivero
