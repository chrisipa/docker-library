Maven
=====

Maven docker image based on Debian Jessie and Oracle JDK 8.

# Description

This Maven docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)

# How to run the container

## Using docker

### Example 1: Run version check in Maven container 

1. Run the Maven container with the following command:
  ```
  docker run --rm chrisipa/mvn -version
  ```

## Advanced topics

### Accept self signed SSL certificates from JRE

1. Create sub folder for trusted SSL certificates:
  ```
  sudo mkdir -p /opt/ssl/trusted
  ```

2. Use [OpenSSL](https://www.openssl.org/) to download the self signed certificate to trusted SSL certificates folder:
  ```
  echo "GET /" | openssl s_client -connect my.host.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /opt/ssl/trusted/my-self-signed.crt
  ```

3. Run Java container with the commands above and mount folder for trusted SSL certificates:
  ```
  -v /opt/ssl/trusted:/opt/ssl/trusted
  ```
