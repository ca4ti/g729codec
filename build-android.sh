export ANDROID_NDK_ROOT=/Users/bogdan/android-ndk-r15c

make clean && make distclean
rm -rf ../build-android/*

#patch -p1 < g729_pjsua2.6.patch
./configure-android --prefix /Users/bogdan/projects/pjsip_custom/build-android

cp pjlib/include/pj/config_site_sample.h pjlib/include/pj/config_site.h
awk -v "n=22" -v "s=#define PJ_CONFIG_ANDROID 1" '(NR==n) { print s } 1' pjlib/include/pj/config_site.h > pjlib/include/pj/config_site.h.tmp
mv pjlib/include/pj/config_site.h.tmp pjlib/include/pj/config_site.h

awk -v "n=23" -v "s=#define PJ_IS_BIG_ENDIAN 0\n#define PJ_IS_LITTLE_ENDIAN 1" '(NR==n) { print s } 1' pjlib/include/pj/config.h > pjlib/include/pj/config.h.tmp
mv pjlib/include/pj/config.h.tmp pjlib/include/pj/config.h

make dep && make
make install
