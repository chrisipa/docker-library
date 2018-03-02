Apache Bench (multi url)
========================

Apache Bench (multi url) docker image to execute load tests.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/ab-pom/ab-multi-url).

# Description
This Apache Bench docker image contains the following software components:

 - [Apache Bench (multi url)](https://github.com/philipgloyne/apachebench-for-multi-url)


# How to run the container

## Using docker

### Example: Test multiple urls with 1000 samples and 10 concurrent requests

1. Create a txt file with all urls you want to test with apache bench
  ```
  nano urls.txt
  
  http://www.google.com/
  http://www.microsoft.com/
  ```  

1. Run Apache Bench container with this command:
  ```
  docker run --rm -v $(pwd)/urls.txt:/urls.txt chrisipa/ab-multi-url -n 1000 -c 10 -L /urls.txt
  ```