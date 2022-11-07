# InspiringTest

Hay que desarrollar un buscador de facts de Chuck Norris que se obtienen de la API https://api.chucknorris.io/

- El buscador tendrá las siguientes características:
  - No necesita login, es abierto.
  - Se permitirá buscar por:
  - Palabras.
  - Categorías.
  - De manera aleatoria.
  - Los resultados se mostrarán paginados.
  - Cada búsqueda junto con los resultados obtenidos se guardarán en base de datos.
  - Existirá la opción de introducir una cuenta de email para que se envíen los resultados de la búsqueda.
  - La aplicación estará disponible en castellano e inglés (los contenidos extraídos de la API no es necesario traducirlos, se pueden presentar en inglés).

La estructura y el diseño de la página y de los correos son completamente libres, al igual que el modelo de datos para guardar la información. Se puede añadir cualquier otra funcionalidad o mejora que se considere.

Forma de entrega: subirlo a un repositorio público de GitHub o Bitbucket incluyendo una carpeta con algunas capturas de pantalla de la solución desarrollada y una pequeña explicación sobre la solución planteada en el Readme.

# Requisitos

- Ruby 3.0.0
- PostgreSQL 12
- Rails 7.0.4
- Node v19.0.0
- Yarn 1.22.19
---

- Configuración
    - En la carpeta del proyecto ejecutar: 
        ```
        gem install bundle
        bundle install
        rails db:create db:migrate
        ./bin/dev
        ```

