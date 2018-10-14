### Dockerized OpenSSL

#### Build and run

```
git clone...

docker build -t openssl:local --build-arg VERSION=1.1.1 openssl/

docker run -it --rm openssl:local help
```