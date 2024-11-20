CC=gcc
CFLAGS=-O3 -g
 
TARGET=test mandel
 
all: $(TARGET)
 
libppm.so : ppm.c
	$(CC) $(CFLAGS)  -fpic -shared $^ -o $@
 
test: main.c libppm.so
	$(CC) $(CFLAGS) $(LDFLAGS) main.c -lppm -L. -Wl,-rpath,. -o $@

mandel: mandel.c libppm.so
	$(CC) $(CFLAGS) $(LDFLAGS) mandel.c -lppm -L. -Wl,-rpath,. -lm -o $@
 

clean:
	rm -fr $(TARGET) *.so
