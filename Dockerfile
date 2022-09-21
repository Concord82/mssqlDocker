FROM mcr.microsoft.com/mssql/server:2017-latest

ENV SA_PASSWORD HZpYw4u5FnnR#puqZBiUV2%SnwU#w415
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express
ENV DBASE DB001
ENV USER_NAME USER001
ENV USER_PASS FnnR#puqZBiUV2SnwU#w415

USER root

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY create-database.sql create-database.sql
COPY --chmod=555  run-initialization.sh run-initialization.sh
COPY --chmod=555  entrypoint.sh entrypoint.sh

#RUN chmod +x run-initialization.sh

CMD /bin/bash ./entrypoint.sh