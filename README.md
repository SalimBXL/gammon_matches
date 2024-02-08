# README


## Versions
* Ruby 3.3.0
* Rails 7.1.2

## Database
Database is Postgresql.

### Database configuration
The database configuration is stored into a Yaml type file at the root of the project. This file must be into the .gitignore file!
```
touch ./.env.yml
echo 'DATABASE_PROD: "GAMMON_MATCHES_DATABASE"' >> ./.env.yml
echo 'DATABASE_DEV: "GAMMON_MATCHES_DATABASE_dev"' >> ./.env.yml
echo 'DATABASE_TEST: "GAMMON_MATCHES_DATABASE_test"' >> ./.env.yml
echo 'DATABASE_PORT: "5432"' >> ./.env.yml
echo 'DATABASE_HOST: "localhost"' >> ./.env.yml
echo 'DATABASE_USERNAME: "[USERNAME]"' >> ./.env.yml
echo 'DATABASE_PASSWORD: "[PASSWORD]"' >> ./.env.yml
```
### Install and Update repository
```
bundle install
bundle update
```

### Database initialisation
```
rails db:create
rails db:migrate
rails db:seed
```

### Theme personalisation
The default theme is grey. You can personalise it by adding a color into the .env.yml file.
```
echo 'THEME_COLOR: "[COLOR]"' >> ./.env.yml
```
