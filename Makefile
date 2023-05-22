routine : main.c libhsshared.so.1.0 libhsstatic.a
	install -d ./output
	gcc -o ./output/sharedprog main.c -L./ -lhsshared
	gcc -Wall -I./ main.c -lhsstatic -L./ -o ./output/staticprog
	mv ./lib* ./output

libhsshared.so.1.0 : arith.o print.o
	gcc -shared -Wl,-soname,libhsshared.so.1 -o libhsshared.so.1.0 arith.o print.o
	ln -s libhsshared.so.1.0 libhsshared.so.1
	ln -s libhsshared.so.1 libhsshared.so

libhsstatic.a : arith.o print.o
	ar rcs libhsstatic.a arith.o print.o

arith.o : arith.c
	gcc -Wall -fPIC -c -o arith.o arith.c

print.o : print.c
	gcc -Wall -fPIC -c -o print.o print.c 

clean :
	rm -rf *.o
	rm -rf output
