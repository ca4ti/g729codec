./configure --enable-shared --prefix=/usr
cp pjlib/include/pj/config_site_sample.h pjlib/include/pj/config_site.h
make dep && make
sudo make install
