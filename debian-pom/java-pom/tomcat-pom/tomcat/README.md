Apache Tomcat
=============

Apache Tomcat docker image based on Debian Jessie and Oracle JDK 8.

# Description
This Tomcat docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Tomcat 7](https://tomcat.apache.org/index.html)

## Ports
These tcp ports are exposed:

 - 8080 (http)
 - 8443 (https)

# How to run the container

## Environment variables

When you start the Tomcat container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `CATALINA_OPTS`

 - Java runtime options used when the "start", "run" or "debug" command is executed 
 - Default value:  

## Using docker

### Example 1: Run Tomcat container with java memory options for max heap size

Run the Tomcat container with the following command:
  ```
  docker run --name tomcat -d -p 8080:8080 -p 8443:8443 -e "CATALINA_OPTS=-Xmx768m" chrisipa/tomcat
  ```

## Advanced topics

### Use your own SSL certificates

1. Generate your own Java keystore file named `keystore` with password `changeit` by answering all questions:
  ```
  keytool -genkey -alias tomcat -keyalg RSA -keysize 2048 -keystore keystore
  ```

2. Generate a CSR from your newly generated Java keystore:
  ```
  keytool -certreq -alias tomcat -file csr.txt -keystore keystore
  ```

3. Upload your `csr.txt` to your SSL provider and generate a P7B SSL certificate for tomcat

4. Import the generated P7B SSL certificate into your Java keystore:
  ```
  keytool -import -trustcacerts -alias tomcat -file your_site_name.p7b -keystore keystore
  ```

5. Place your Java keystore in a folder of your choice and mount it to the `/opt/ssl/tomcat` folder of your docker container:
  ```
  -v /opt/ssl/tomcat:/opt/ssl/tomcat
  ```
