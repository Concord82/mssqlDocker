# Docker MSSQL 2017
## Сборка образа
Образ собирается командой. 

    docker build -t mssql2017 --no-cache

```-t mssql2017 имя получаемого образа ```

Если потребуется сменить версию mssql требуется изменить секцию FROM в Dockerfile

В образе реализованно при старте создание базы данных, пользователя и предоставление пользователю прав на эту БД.

## Запуск контейнера

    docker run -d \
    --name mssql2017-instance \
    -p 1433:1433  \
    -v data:/var/lib/mssqlql/data \
    mssql2017

--name - имя инстанса

-p - сопоставление портов

-v - монтирование каталогов

База данных размешается в контейнере по пути /var/opt/mssql/data/ Для сохранности данных требуется монтировать данный каталог к каталогу хост машины. Для тестовых запусков можно не указывать. 

Можно добавить строку 

    -v log:/var/opt/mssql/log \ 

Для доступа к логам контейнера.

## Запуск из docker compose

Параметры контейнера указанны в файле .env Правим файл под задачу задавая имя БД и данные пользователя. 

### Старт контейнера в режиме демона

    docker compose up -d

### Останов контейнера 

    docker compose down

### Доступ к базе данных через sqlcmd 

Войти в контейнер 

    docker exec -it sql-server2017-db /bin/bash

и выполнить от имени пользователя sa:

    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD

от имени созданного непривелигироанного пользователя:

    /opt/mssql-tools/bin/sqlcmd -S localhost -U $USER_NAME -P $USER_PASS
