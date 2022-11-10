# InspiringTest

Hay que desarrollar un buscador de facts de Chuck Norris que se obtienen de la API https://api.chucknorris.io/

- El buscador tendrá las siguientes características:
  - No necesita login, es abierto.
  - Se permitirá buscar por:
    - Palabras.
    - Categorías.
    - De manera aleatoria.
  - Los resultados se mostrarán paginados.
  - Cada búsqueda junto con los resultados obtenidos se guardarán en la base de datos.
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

# Configuración
  - En la carpeta del proyecto ejecutar: 

      ```
        gem install bundle
        bundle install
        rails db:create db:migrate
        ./bin/dev
    ```
# Solución 

Para el desarrollo de Inspiring Test se utilizó el patrón de diseño modelo, vista, controlador(MVC) y para las características solicitadas se utilizaron las siguientes gemas:

- Para el usuario se usó la gema Devise, que permite manejar sesiones de invitados, de esta manera se puede saber qué usuario se encuentra conectado y en caso de que envíe los Fact ́s a su email se puede persistir el email.
- Para la integración con el api.chucknorris.io se usó la gema Faraday por su simpleza y flexibilidad.
- Los resultados se muestran paginados con Kaminari y para mejorar su apariencia se utilizó la gema bootstrap5-kaminari-views.
- Para el email se utilizó el mailer de rails.
- Para la internacionalización se utilizó la gema rails-i18n, se ajustaron las rutas para que el cambio de idiomas sea dinámico basado en la selección del menú.
- Cada búsqueda queda persistida en la base de datos, los datos persistidos son:
  - Query de la búsqueda
  - Usuario invitado que hizo la búsqueda
  - Resultado de la búsqueda, incluyendo la url del Chuck Norris Fact, categoría y su contenido.

# Modelo

<img width="600" alt="Screenshot_1" src="https://user-images.githubusercontent.com/4138880/201215838-b22a4f4f-0a1b-48bb-aa88-0ef7de8f67fc.png">

# Español

![Image](https://user-images.githubusercontent.com/4138880/201219094-47d472a9-dbc1-4d15-883f-a37a18dc99ef.png)

![Image](https://user-images.githubusercontent.com/4138880/201219095-0ba90e9b-7561-42ef-b147-532690eb068a.png)

# Inglés

![Image](https://user-images.githubusercontent.com/4138880/201219093-a13f36b8-ff3b-4674-aaac-fe319faf75e0.png)

![Image](https://user-images.githubusercontent.com/4138880/201219092-9c3bd33e-96bb-4eb7-a368-bf49974ed5bf.png)

# Próximas mejoras

- Agregar envío asíncrono de emails usando redis y sidekiq.
- Mejorar el manejo de errores y la forma en que se muestran.
- Dockerizar proyecto.