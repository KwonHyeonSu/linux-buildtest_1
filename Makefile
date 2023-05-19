routine : main.c libhi.so.1.0.0
	gcc -o main main.c -L./ -lhi

libhi.so.1.0.0 : arith.o print.o
	gcc -shared -o libhi.so.1.0.0 arith.o print.o
	ln -s libhi.so.1.0.0 libhi.so.1.0
	ln -s libhi.so.1.0 libhi.so.1
	ln -s libhi.so.1 libhi.so

arith.o : arith.c
	gcc -Wall -fPIC -c -o arith.o arith.c

print.o : print.c
	gcc -Wall -fPIC -c -o print.o print.c 

clean :
	rm -rf *.o
	rm -rf lib*
	rm -rf main
