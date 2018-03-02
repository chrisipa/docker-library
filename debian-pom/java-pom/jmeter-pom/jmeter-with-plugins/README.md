Apache JMeter
=============

JMeter docker image with additional plugins based on Debian Jessie and Oracle JDK 8.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jmeter-pom/jmeter-with-plugins).

# Description

This JMeter docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache JMeter](https://jmeter.apache.org/download_jmeter.cgi)
 - [JMeter Standard Plugins](https://jmeter-plugins.org/)
 - [JMeter Extras Plugins](https://jmeter-plugins.org/)

# How to run the container

## Using docker

* See parent image: [chrisipa/jmeter](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jmeter-pom/jmeter#using-docker)

## Advanced topics

### Accept self signed SSL certificates from Maven JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)