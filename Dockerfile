FROM mongo
WORKDIR /docker-entrypoint-initdb.d
COPY . .