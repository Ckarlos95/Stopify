# stopify

Proyecto de Minería de Datos.
This project is powered by [Amber Framework](https://amberframework.org/).

## Instrucciones
1. Instalar [Crystal](https://crystal-lang.org/):
  ```
  curl https://dist.crystal-lang.org/apt/setup.sh | sudo bash
  sudo apt-get install crystal
  ```
  Más info [aquí](https://crystal-lang.org/docs/installation/on_debian_and_ubuntu.html).

2. Instalar [Amber](https://amberframework.org/):
  * Tener instaladas las dependencias
    - Git: `sudo apt-get install git`
    - NodeJS v6.14.1 o mayor (descargar [aquí](https://nodejs.org/es/download/))
    - MySQL
      ```
      sudo apt-get update
      sudo apt-get install mysql-server
      mysql_secure_installation

      ```
  * Instalar las dependencias de Amber
    ```
    sudo apt-get install build-essential libreadline-dev libsqlite3-dev libpq-dev libmysqlclient-dev libssl-dev libyaml-dev
    ```
  * Descargar e instalar Amber
    ```
    curl -L https://github.com/amberframework/amber/archive/stable.tar.gz | tar xz
    cd amber-stable/
    shards install
    make install
    ```
    En caso de error al ejecutar `make install`, intentar `sudo make install` (2 veces si es necesario)

  * Checar la instalación de Amber
    ```
    amber -v
    ```

  Más info [aquí](https://amberframework.org/guides/getting-started/Installation/README.md#installation).

3. Clonar el proyecto e instalar las dependencias
  ```
  git clone https://github.com/Ckarlos95/Stopify.git
  cd Stopify/
  shards install
  ```

4. Modificar la entrada `database_url` del archivo `config/environments/development.yml` como sigue:
  > database_url: mysql://**tu_usuario**:**contraseña**@localhost:3306/stopify_development

  El usuario deberá tener los permisos necesarios para crear bases, tablas, etc.

5. Editar el archivo `lib/granite_orm/src/granite_orm/associations.cr` y agregar lo siguiente dentro del modulo `Granite::ORM::Associations`

  ```crystal
  # defines method for a relationship with an alias
  macro has_many_as(children_table, alias_for)
    def {{children_table.id}}
      {% children_class = alias_for.id[0...-1].camelcase %}
      {% name_space = @type.name.gsub(/::/, "_").downcase.id %}
      {% table_name = SETTINGS[:table_name] || name_space + "s" %}
      return [] of {{children_class}} unless id
      foreign_key = "{{alias_for.id}}.{{table_name[0...-1]}}_id"
      query = "WHERE #{foreign_key} = ?"
      {{children_class}}.all(query, id)
    end
  end
  ```

6. Crear la base de datos y correr las migraciones
  ```
  amber db create migrate
  ```

7. Iniciar el servidor
  ```
  amber w
  ```

8. Abrir el navegador en `http://localhost:3000/`
  * En caso de obtener un error al intentar iniciar sesión (la sesión no inicia aunque los datos sean correctos) intentar iniciar sesión con un correo que no esté registrado hasta que aparezca un mensaje de error, entonces iniciar sesión con los datos correctos.

## Installation

1. [Install required dependencies](https://github.com/amberframework/online-docs/blob/master/getting-started/quickstart/zero-to-deploy.md#install-crystal-and-amber)
2. Run `shards install`

## Usage

To setup your database edit `database_url` inside `config/environments/development.yml` file.

To edit your production settings use `amber encrypt`. [See encrypt command guide](https://github.com/amberframework/online-docs/blob/master/getting-started/cli/encrypt.md#encrypt-command)

To run amber server in a **development** enviroment:

```
amber db create migrate
amber watch
```

To build and run a **production** release:

1. Add an environment variable `AMBER_ENV` with a value of `production`
2. Run these commands:

```
npm run release
amber db create migrate
shards build --production
./bin/stopify
```

## Docker Compose

To set up the database and launch the server:

```
docker-compose up -d
```

To view the logs:

```
docker-compose logs -f
```

> **Note:** The Docker images are compatible with Heroku.

## Contributing

1. Fork it ( https://github.com/Ckarlos95/stopify/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Ckarlos95](https://github.com/Ckarlos95) Carlos Aguilera - creator, maintainer
