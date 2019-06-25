#!/bin/bash

TARGET_DIR=build-macos

make clean && make distclean
rm -rf ../$TARGET_DIR/*

#patch -p1 < g729_pjsua2.6.patch

./configure --prefix $HOME/projects/pjsip_custom/$TARGET_DIR --with-gnutls=/usr/local/Cellar/gnutls/3.6.8 --disable-darwin-ssl --disable-ssl

cp pjlib/include/pj/config_site_sample.h pjlib/include/pj/config_site.h

make dep && make
make install
