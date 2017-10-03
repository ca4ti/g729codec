export ANDROID_NDK_ROOT=/Users/bogdan/android-ndk-r15c

#patch -p1 < g729_pjsua2.6.patch
./configure-android --prefix /Users/bogdan/projects/pjsip_custom/build-android

cp pjlib/include/pj/config_site_sample.h pjlib/include/pj/config_site.h
awk -v "n=22" -v "s=#define PJ_CONFIG_ANDROID 1" '(NR==n) { print s } 1' pjlib/include/pj/config_site.h > pjlib/include/pj/config_site.h.tmp
mv pjlib/include/pj/config_site.h.tmp pjlib/include/pj/config_site.h

make dep && make
make install
