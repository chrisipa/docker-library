Jenkins (JCE)
=============

Jenkins docker image with useful tools for Java development with Maven builds including JCE.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jenkins-pom/jenkins-jce).

# Description
This Jenkins docker image contains the following software components:

 - [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)
 - [GIT](https://git-scm.com/downloads)
 - [Java Cryptography Extension](http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html)
 - [Jenkins](https://jenkins-ci.org/)
 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)


## Ports
These Jenkins ports are exposed:

  - 8080 (GUI)
  - 50000 (Build agents)


# How to run the container

## Using docker

* See parent image: [chrisipa/jenkins](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jenkins-pom/jenkins#using-docker)

## Advanced topics

### Accept self signed SSL certificates from Jenkins JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)