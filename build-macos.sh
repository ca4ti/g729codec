patch -p1 < g729_pjsua2.6.patch
./configure --enable-shared --with-opus=/usr/local/ --with-sdl=/usr/local/ --with-ssl=/usr/local/opt/openssl
cp pjlib/include/pj/config_site_sample.h pjlib/include/pj/config_site.h
make dep && make
sudo make install
