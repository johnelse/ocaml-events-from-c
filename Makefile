PROGRAM=events

$(PROGRAM): $(PROGRAM)_stubs.c $(PROGRAM).ml
	ocamlopt -thread unix.cmxa threads.cmxa $(PROGRAM)_stubs.c $(PROGRAM).ml -o $(PROGRAM)

clean:
	rm -f $(PROGRAM) *.cmi *.cmx *.o
