 wget https://www.openssl.org/source/openssl-3.1.1.tar.gz
vi openssl.install.sh
 cd openssl-3.1.1
  ./config --prefix=/opt/openssl --openssldir=/usr/local/ssl
  make
   make test
make install
