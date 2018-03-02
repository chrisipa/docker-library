Debian
======

Debian docker image based on Debian Jessie with useful debugging tools preinstalled.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/debian).

# Description
This Debian docker image contains the following software packages:

 - curl
 - nano
 - netcat
 - telnet
 - unzip 
 - vim
 - wget

Also part of this image are this default features:

 - Colored directory listing
 - Aliases for `l` and `..`
 - History search in console with page up and down
 
# How to run the container

## Using docker

### Example 1: Run bash in Debian container 

1. Run the Debian container with the following command:
  ```
  docker run --rm -it chrisipa/debian
  ``` 