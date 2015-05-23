ifndef FSTAR_HOME
$(error FSTAR_HOME is not set)
endif
DEBUG = true
FSTAR = $(FSTAR_HOME)/bin/fstar.exe
LIB_FILES = string.fst io.fst bytes.fst tcp.fst list.fst option.fst 
STDLIB = $(addprefix $(FSTAR_HOME)/lib/, $(LIB_FILES))

VERFILES=hello.fst

FSTARFLAGS = --codegen OCaml

OUTPUT = program

run:	
	./$(OUTPUT)

compile: $(wildcard *.ml)  
	ocamlfind ocamlopt -o $(OUTPUT) -package batteries -linkpkg -thread -I $(FSTAR_HOME)/src/ocaml-output/ $(FSTAR_HOME)/src/ocaml-output/support.ml $^

translate: 
	$(FSTAR) $(FSTARFLAGS) $(STDLIB) $(VERFILES)

clean:
	rm -f *.ml
	rm -f *.cmx
	rm -f *.cmi
	rm -f *.o
	rm -f $(OUTPUT)	
