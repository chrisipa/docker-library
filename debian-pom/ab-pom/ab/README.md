Apache Bench
============

Apache Bench docker image to execute load tests.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/ab-pom/ab).

# Description
This Apache Bench docker image contains the following software components:

 - [Apache Bench](https://httpd.apache.org/docs/2.4/programs/ab.html)


# How to run the container

## Using docker

### Example: Test domain google.com with 1000 samples and 10 concurrent requests

1. Run Apache Bench container with this command:
  ```
  docker run --rm chrisipa/ab -n 1000 -c 10 http://www.google.com/
  ```