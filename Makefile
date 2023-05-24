routine : main.c libhsshared.so.1.0 libhsstatic.a
	install -d ./output
	${CC} -Wall main.c -L./ -lhsshared -Wl,-rpath,/home/gotgam/work/linux-buildtest_1/output  -o ./output/sharedprog
	${CC} -Wall main.c -L./ -lhsstatic -o ./output/staticprog
	mv ./lib* ./output

libhsshared.so.1.0 : arith.o print.o
	${CC} -shared -Wl,-soname,libhsshared.so.1 -o libhsshared.so.1.0 arith.o print.o
	ln -s libhsshared.so.1.0 libhsshared.so.1
	ln -s libhsshared.so.1 libhsshared.so

libhsstatic.a : arith.o print.o
	${AR} rcs libhsstatic.a arith.o print.o

arith.o : arith.c
	${CC} -Wall -fPIC -c -o arith.o arith.c

print.o : print.c
	${CC} -Wall -fPIC -c -o print.o print.c 

clean :
	rm -rf *.o
	rm -rf output
