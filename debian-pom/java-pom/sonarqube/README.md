docker-sonarqube
=============

Sonarqube docker image based on Debian Jessie and Oracle JDK 8.

# Description
This Sonarqube docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Sonarqube](http://www.sonarqube.org/)

For data storage you will need a relational database. At the moment, these databases are supported:

 - [MySQL](http://www.mysql.com/)
 - [PostgreSQL](http://www.postgresql.org/)

## Ports
These tcp ports are exposed:

 - 9000 (Web frontend)

# How to run the container

## Environment variables

When you start the Sonarqube container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `DB_TYPE`

 - The database type to use
 - Possible values: `mysql`, `postgresql`
 - Default value: `mysql`

### `DB_HOST`

 - The database hostname or ip address as string
 - Default value: `$MYSQL_PORT_3306_TCP_ADDR` or `sonarqube-mysql`

### `DB_PORT`

 - The database port as a numeric value
 - Default value: `$MYSQL_PORT_3306_TCP_PORT` or `3306`

### `DB_NAME`

 - The database name as string
 - Default value: `$MYSQL_ENV_MYSQL_DATABASE` or `sonarqube`

### `DB_USER`

 - The database user as string
 - Default value: `$MYSQL_ENV_MYSQL_USER` or `sonarqube`

### `DB_PASS`

 - The database password as string
 - Default value: `$MYSQL_ENV_MYSQL_PASSWORD` or `my-password`

### `SONARQUBE_CONTEXT_PATH`

 - The webapp context path as string
 - Default value: 
 
### `SONARQUBE_JAVA_OPTS`

 - The java command line arguments for the sonarqube java process
 - Default value: 

## Using docker

### Example 1: MySQL server on external host with default port

1. Make sure that your mysql database server allows [external access](http://www.cyberciti.biz/tips/how-do-i-enable-remote-access-to-mysql-database-server.html)

2. Create a database with name `sonarqube` and allow user `sonarqube` to access it

3. Run the Sonarqube container with the following command:
  ```
  docker run --name sonarqube-app -d -p 9000:9000 -e DB_HOST=192.168.0.1 -e DB_PASS=my-password -v /opt/docker/sonarqube/app/conf:/opt/sonarqube/conf -v /opt/docker/sonarqube/app/data:/opt/sonarqube/data -v /opt/docker/sonarqube/app/extensions:/opt/sonarqube/extensions chrisipa/sonarqube
  ```

### Example 2: MySQL server as docker container on the same docker host

1. Run mysql container with this command:
  ```
  docker run --name sonarqube-mysql -d -e MYSQL_ROOT_PASSWORD=my-root-password -e MYSQL_DATABASE=sonarqube -e MYSQL_USER=sonarqube -e MYSQL_PASSWORD=my-password -v /opt/docker/sonarqube/mysql:/var/lib/mysql mysql:latest
  ```

2. Run Sonarqube container by linking to the newly created mysql container:
  ```
  docker run --name sonarqube-app --link sonarqube-mysql:mysql -d -p 9000:9000 -v /opt/docker/sonarqube/app/conf:/opt/sonarqube/conf -v /opt/docker/sonarqube/app/data:/opt/sonarqube/data -v /opt/docker/sonarqube/app/extensions:/opt/sonarqube/extensions chrisipa/sonarqube
  ```

### Example 3: Running docker containers with compose

1. Create docker compose file `docker-compose.yml` with your configuration data:
  ```yml
  mysql:
    image: mysql
    volumes:
      - /opt/docker/sonarqube/mysql:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=my-root-password
      - MYSQL_DATABASE=sonarqube
      - MYSQL_USER=sonarqube
      - MYSQL_PASSWORD=my-password

  sonarqube:
    image: chrisipa/sonarqube
    links:
      - mysql:mysql
    ports:
      - 9000:9000
    volumes:
      - /opt/docker/sonarqube/app/conf:/opt/sonarqube/conf
      - /opt/docker/sonarqube/app/data:/opt/sonarqube/data
      - /opt/docker/sonarqube/app/extensions:/opt/sonarqube/extensions
      - /opt/docker/sonarqube/app/logs:/opt/sonarqube/logs
    environment:
      - SONARQUBE_CONTEXT_PATH=/sonar
  ```

2. Run docker containers with docker compose:
  ```
  docker-compose up -d
  ```
  
## Advanced topics

### Accept self signed SSL certificates from Sonarqube JRE

See parent image: [chrisipa/java](https://github.com/chrisipa/docker-java#accept-self-signed-ssl-certificates-from-jre)
