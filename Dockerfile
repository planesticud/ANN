FROM golang:1.11
WORKDIR /
COPY main main
COPY conf/app.conf conf/app.conf
RUN ANN_CRUD__PGURLS=$ANN_CRUD__PGURLS ./main orm syncdb -db="default" -force=true -v=true
CMD ANN_CRUD__PGURLS=$ANN_CRUD__PGURLS ANN_CRUD_HTTP_PORT=$ANN_CRUD_HTTP_PORT ./main
