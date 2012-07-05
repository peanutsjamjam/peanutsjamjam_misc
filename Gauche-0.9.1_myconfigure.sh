#! /bin/sh

./configure --with-iconv=/usr/local \
	--with-local=/usr/local \
	--enable-ipv6 \
	--mandir=/usr/local/man \
	--docdir=/usr/local/share/doc/gauche
