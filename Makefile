routine : main.c libhi.so
	gcc -o main main.c -L./ -lhi

libhi.so : arith.o print.o
	gcc -shared -o libhi.so arith.o print.o

arith.o : arith.c
	gcc -Wall -fPIC -c -o arith.o arith.c

print.o : print.c
	gcc -Wall -fPIC -c -o print.o print.c 

clean :
	rm -rf *.o
	rm -rf lib*
	rm -rf $(TARGET)
