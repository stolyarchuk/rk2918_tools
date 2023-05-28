CC=gcc
CFLAGS := -g -O3 -DUSE_OPENSSL -Wall
LDLIBS := -lssl -lcrypto

#CFLAGS := -DUSE_GCRYPT
#LDLIBS := -lgcrypt

TARGETS := afptool img_unpack img_maker mkkrnlimg

all: ${TARGETS}

clean:
	${RM} ${TARGETS}

install: ${TARGETS}
	install -d -m 0755 ${DESTDIR}/${PREFIX}/bin
	install -m 0755 ${TARGETS} ${DESTDIR}/${PREFIX}/bin	

uninstall:
	cd ${DESTDIR}/${PREFIX}/bin && ${RM} -f ${TARGETS}
