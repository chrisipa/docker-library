# Docker

## Prerequisities

* [Please make sure that you have installed docker correctly](INSTALL.md)

## Build

### Build images

* Build images:
    ```
    mvn clean docker:build
    ```

* Build images with docker cache disabled:
    ```
    mvn clean docker:build -D docker.nocache
    ```

* Build images with image tag "master":
    ```
    mvn clean docker:build -D image.tag=master
    ```

* Build single image "jenkins":
    ```
    mvn clean docker:build -pl :jenkins
    ```

### Test containers

* Start containers:
    ```
    mvn docker:start
    ```

* Start single container "jenkins":
    ```
    mvn docker:start -pl :jenkins
    ```

* Stop containers:
    ```
    mvn docker:stop
    ```

* Stop single container "jenkins":
    ```
    mvn docker:stop -pl :jenkins
    ```

### Cleanup containers and images

* Launch cleanup script (removes all containers and images):
    ```
    ./cleanup.sh
    ```

## Additional information

* https://github.com/fabric8io/docker-maven-plugin
* https://dmp.fabric8.io/