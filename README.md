# jenkins-php

included php5, phpunit, xdebug 2.4.1, nodejs 6.3.1

```bash
docker run -it --rm -p 8081:8080 -p 50000:50000 -v /data/jenkins:/var/jenkins_home liang123/jenkins-php
```

or install specific version xdebug/nodejs

```bash
docker run -it --rm \
  -p 8081:8080 -p 50000:50000 \
  -v /data/jenkins:/var/jenkins_home \
  -e XDEBUG_VERSION=2.4.1 \
  -e XDEBUG_SHA1=52b5cede5dcb815de469d671bfdc626aec8adee3 \
  -e NODEJS_VERSION=6.3.1 \
  -e NODEJS_SHA256=eccc530696d18b07c5785e317b2babbea9c1dd14dbab80be734b820fc241ddea \
  liang123/jenkins-php
```
