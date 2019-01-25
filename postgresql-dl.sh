#!/bin/sh
version=9.6.7
if [ ! -f postgresql-$version.tar.bz2 ]; then
  curl -O https://ftp.postgresql.org/pub/source/v$version/postgresql-$version.tar.bz2
else
  echo postgresql-$version.tar.bz2 exists
fi
sha256sum postgresql-$version.tar.bz2

if [ ! -f postgresql-$version-1-windows-x64-binaries.zip ]; then
	curl -O http://get.enterprisedb.com/postgresql/postgresql-$version-1-windows-x64-binaries.zip
	rm -fr pgsql
	unzip postgresql-$version-1-windows-x64-binaries.zip
	rm -fr pgsql/doc pgsql/pgAdmin\ 4 pgsql/StackBuilder pgsql/symbols
	rm postgresql-$version-1-windows-x64-binaries.zip
	zip -r postgresql-$version-1-windows-x64-binaries.zip pgsql
	rm -fr pgsql
else
	echo postgresql-$version-1-windows-x64-binaries.zip exists
fi
sha256sum postgresql-$version-1-windows-x64-binaries.zip
