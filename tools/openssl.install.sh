output=$(wget --spider -r --no-parent -nd -np -A 'openssl-[0-9].[0-9].[0-9].tar.gz' https://www.openssl.org/source/ 2>&1 | grep -o 'https://[^ ]*openssl.*\.tar\.gz')
target=$(for url in $output; do echo "$url"; done | sort -r | head -n1)
echo "Downloading $target..."


#wget https://www.openssl.org/source/openssl-3.1.1.tar.gz
#tar -xzvf openssl-3.1.1.tar.gz
#cd openssl-3.1.1
#./config --prefix=/opt/openssl --openssldir=/usr/local/ssl
#make
#make test
#make install
