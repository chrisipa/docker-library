Pen load balancer
=================

Pen load balancer docker image based on Debian Jessie.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/pen).

# Description
This Pen load balancer docker image contains the following software components:

 - [Pen](http://siag.nu/pen/)

# How to run the container

## Using docker  

### Example 1: SMTP proxy example

1. Run Pen load balancer container with this command:
  ```
  docker run --rm -p 25:25 chrisipa/apache 25 my.smtp.host:25
  ```

### Example 2: HTTP server SSL load balancer example

1. Create a folder for ssl certificates:
  ```
  sudo mkdir -p /ssl
  ```

2. Place server.crt, server.key and ca.crt file in ssl folder:
  ```
  sudo cp server.crt server.key ca.crt /ssl
  ```  

3. Run Pen load balancer container with this command:
  ```
docker run --rm -p 443:443 -v /ssl:/ssl chrisipa/pen 443 -E /ssl/server.crt -K /ssl/server.key -G /ssl/ca.crt my.server.host1:80 my.server.host2:80 
  ```