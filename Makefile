jc: jc.o token.o compiler.o
	clang-15 -g3 -gdwarf-4 -Wall -o jc jc.o token.o compiler.o

jc.o: jc.c token.h compiler.h
	clang-15 -g3 -gdwarf-4 -Wall -c jc.c

token.o: token.c token.h 
	clang-15 -g3 -gdwarf-4 -Wall -c token.c

compiler.o: compiler.c compiler.h token.h
	clang-15 -g3 -gdwarf-4 -Wall -c compiler.c

clean:
	rm -f *.o jc *~