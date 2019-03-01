# Docker Library

Docker library project for building useful docker images with the maven docker plugin.

## Images

Here's a list of all docker images sorted by category.

### Artifact Repositories

* [Sonatype Nexus](debian-pom/java-pom/nexus/README.md)

### Build Tools

* [Apache Ant](debian-pom/java-pom/build-tool-pom/ant/README.md)
* [Apache Maven](debian-pom/java-pom/build-tool-pom/mvn/README.md)
* [Gradle](debian-pom/java-pom/build-tool-pom/gradle/README.md)
* [Jenkins](debian-pom/java-pom/jenkins-pom/jenkins/README.md)
* [Jenkins JCE](debian-pom/java-pom/jenkins-pom/jenkins-jce/README.md)

### Load Test Tools

* [Apache Bench](debian-pom/ab-pom/ab/README.md)
* [Apache Bench (multi url)](debian-pom/ab-pom/ab-multi-url/README.md)
* [Apache JMeter](debian-pom/java-pom/jmeter-pom/jmeter/README.md)
* [Apache JMeter (with plugins)](debian-pom/java-pom/jmeter-pom/jmeter-with-plugins/README.md)
 
### Operating Systems

* [Debian](debian-pom/debian/README.md)

### Runtimes

* [Oracle JDK](debian-pom/java-pom/jdk/README.md)

### Secrets Management

* [One Time Secret](debian-pom/onetimesecret/README.md)

### Static Code Analysis

* [Sonarqube](debian-pom/java-pom/sonarqube/README.md)

### Web Servers

* [Apache HTTPD](debian-pom/apache/README.md)
* [Apache Tomcat](debian-pom/java-pom/tomcat-pom/tomcat/README.md)

## Build

To build this project you'll have to install some tools on your machine.

### Prerequisities

* [Oracle JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Apache Maven](https://maven.apache.org/download.cgi)
* [Docker](INSTALL.md)

### Script

* Execute build script:
    ```
    Usage:
      ./build.sh [Options] <Args>

    Options:
      -h                    Print this help text
      -c                    Remove all docker containers and images
      -d                    Deploy docker images to docker registry
      -f                    Build docker images without build cache
      -p <project-list>     Build comma separated maven project list
      -s                    Create docker containers from images and start them
      -t <tag>              Build with specified image tag
      -v                    Verbose logging of errors (optimise flag false)

    Examples:
      ./build.sh                                     Build all docker images
      ./build.sh -c                                  Remove all docker containers and images
      ./build.sh -p debian,jdk                       Build only docker images for 'debian' and 'jdk'
      ./build.sh -p debian,jdk -t master -f          -> and tag with name 'master'
      ./build.sh -p debian,jdk -t master -f          -> and do not use docker build cache
      ./build.sh -p debian,jdk -t master -f -s       -> and start containers
      ./build.sh -p debian,jdk -t master -f -s -d    -> and deploy to docker registry
      ./build.sh -p debian,jdk -t master -f -s -d -v -> and verbose logging of errors      
    ```

## Additional information

* https://github.com/fabric8io/docker-maven-plugin
* https://dmp.fabric8.io/