test: libmain-64.so libmain-32.so
	@echo "========32-bit======"
	./libmain-32.so
	@echo "\n========run through /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2======"
	/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 ./libmain-64.so
	@echo "\n========64-bit======"
	./libmain-64.so
libmain-64.so: libmain.c
	gcc -fPIC libmain.c -shared -o libmain-64.so -Wl,-e,__lib_main -m64 -ggdb3
libmain-32.so: libmain.c
	gcc -fPIC libmain.c -shared -o libmain-32.so -Wl,-e,__lib_main -m32 -ggdb3

.PHONY: test

