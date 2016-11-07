# Apache 2.4

## Generate default SSL certificates

* Export SSL_DEFAULTS_FOLDER:
    ```
    export SSL_DEFAULTS_FOLDER=<PROJECTS_FOLDER>/docker/debian/apache/ssl
    ```

* Create CA Certificate:
    ```
    openssl req -new -x509 -days 36500 -nodes \
        -out $SSL_DEFAULTS_FOLDER/ca.crt \
        -keyout $SSL_DEFAULTS_FOLDER/ca.key
    ```

* Create Certificate Serial Number:
    ```
    echo -ne '01' > $SSL_DEFAULTS_FOLDER/ca.serial
    ```
    
* Create Server CSR:
    ```
    openssl req -new -days 36500 -nodes \
        -out $SSL_DEFAULTS_FOLDER/server.csr \
        -keyout $SSL_DEFAULTS_FOLDER/server.key
    ```

* Create Server Certificate:
    ```
    openssl x509 -days 36500 \
        -CA $SSL_DEFAULTS_FOLDER/ca.crt \
        -CAkey $SSL_DEFAULTS_FOLDER/ca.key \
        -CAserial $SSL_DEFAULTS_FOLDER/ca.serial \
        -in $SSL_DEFAULTS_FOLDER/server.csr \
        -req \
        -out $SSL_DEFAULTS_FOLDER/server.crt
    ```
    
## Default Values

* Country Code: DE
* State: Germany
* City: Villingen-Schwenningen
* Organization: Kaba Central Services GmbH
* Organizational Unit: Web Factory
* Common Name: localhost
* E-Mail: webadmin@kaba.com
* All other prompted values are empty

## References

* https://wiki.debian.org/Self-Signed_Certificate
* https://www.openssl.org/docs/manmaster/apps/req.html
* https://www.openssl.org/docs/manmaster/apps/x509.html