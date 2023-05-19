all : routine

routine : main.c libmysharedlib.so.1
	gcc -o main main.c -L./ -lmysharedlib

libmysharedlib.so.1 : arith.o print.o
	gcc -shared -o libmylib.so.1 arith.o print.o

arith.o : arith.c mylib.h
	gcc -Wall -fPIC -c -o arith.o arith.c

print.o : print.c mylib.h
	gcc -Wall -fPIC -c -o print.o print.c 

clean :
	rm -rf *.o
	rm -rf lib*
