Ubuntu
======

Ubuntu docker image based on Ubuntu Jessie with useful debugging tools preinstalled.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/ubuntu-pom/ubuntu).

# Description
This Ubuntu docker image contains the following software packages:

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

### Example 1: Run bash in Ubuntu container 

1. Run the Ubuntu container with the following command:
  ```
  docker run --rm -it chrisipa/ubuntu
  ``` 