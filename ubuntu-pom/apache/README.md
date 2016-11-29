# Apache 2.4

## Generate default SSL certificates

* Create CA Certificate:
    ```
    openssl req -new -x509 -days 36500 -nodes \
        -out ca.crt \
        -keyout ca.key
    ```

* Create Certificate Serial Number:
    ```
    echo -ne '01' > ca.serial
    ```
    
* Create Server CSR:
    ```
    openssl req -new -days 36500 -nodes \
        -out server.csr \
        -keyout server.key
    ```

* Create Server Certificate:
    ```
    openssl x509 -days 36500 \
        -CA ca.crt \
        -CAkey ca.key \
        -CAserial ca.serial \
        -in server.csr \
        -req \
        -out server.crt
    ```

## References

* https://wiki.debian.org/Self-Signed_Certificate
* https://www.openssl.org/docs/manmaster/apps/req.html
* https://www.openssl.org/docs/manmaster/apps/x509.html