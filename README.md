### Dockerized OpenSSL tool 

Actual version of OpenSSL

#### Pull and run
```
docker run -it --rm spender0/openssl help
```
#### Build and run

```
git clone https://github.com/spender0/docker-openssl.git

cd docker-openssl

docker build -t openssl:local --build-arg VERSION=1.1.1 .

docker run -it --rm openssl:local help
```
