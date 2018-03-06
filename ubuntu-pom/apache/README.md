Apache HTTPD
==============

Apache HTTPD docker image based on Debian Jessie.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/apache).

# Description
This Apache HTTPD docker image contains the following software components:

 - [Apache HTTPD](https://httpd.apache.org/download.cgi)

## Modules
These Apache HTTPD modules are activated by default:

  - deflate 
  - headers 
  - proxy 
  - proxy_ajp
  - proxy_http 
  - rewrite 
  - ssl

## Ports
These Apache HTTPD ports are exposed:

  - 80 (http)
  - 443 (https)

# How to run the container

## Environment variables

When you start the Apache HTTPD container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `SSL_FOLDER`

 - The folder where the SSL certificate files are located
 - Default value: `/opt/ssl/apache2`


## Using docker  

### Example 1: Evaluation usage without any custom files

1. Run Apache HTTPD container with this command:
  ```
  docker run --rm -p 80:80 -p 443:443 chrisipa/apache
  ```

### Example 2: Daemon usage serving custom static files from host

1. Create a folder with custom static files:
  ```
  sudo mkdir -p /var/www/html  
  ```
  
2. Place static files in target folder:  
  ```
  sudo cp files /var/www/html  
  ```

3. Run Apache HTTPD container with this command:
  ```
docker run -d --name apache -p 80:80 -p 443:443 -v /var/www/html:/var/www/html chrisipa/apache
  ```

## Advanced topics

### Use your own SSL certificates

1. Create CA Certificate:
    ```
    openssl req -new -x509 -days 36500 -nodes \
        -out ca.crt \
        -keyout ca.key
    ```

2. Create Certificate Serial Number:
    ```
    echo -ne '01' > ca.serial
    ```
    
3. Create Server CSR:
    ```
    openssl req -new -days 36500 -nodes \
        -out server.csr \
        -keyout server.key
    ```

4. Create Server Certificate:
    ```
    openssl x509 -days 36500 \
        -CA ca.crt \
        -CAkey ca.key \
        -CAserial ca.serial \
        -in server.csr \
        -req \
        -out server.crt
    ```

### References

* https://wiki.debian.org/Self-Signed_Certificate
* https://www.openssl.org/docs/manmaster/apps/req.html
* https://www.openssl.org/docs/manmaster/apps/x509.html    