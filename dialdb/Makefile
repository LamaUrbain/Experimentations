PROJECT := dial

LINK_PKG := pgocaml

COMP_PKG := pgocaml,pgocaml.syntax


$(PROJECT): $(PROJECT).cmo
	ocamlfind ocamlc -package $(LINK_PKG) -linkpkg -o $@ $<

$(PROJECT).cmo: $(PROJECT).ml
	ocamlc -c dial.mli
	ocamlfind ocamlc -package $(COMP_PKG) -syntax camlp4o -c $<

all: $(PROJECT) clean

clean:
	rm -f *~ *.cm*

fclean:
	rm -f $(PROJECT)
	make clean

re:	fclean all
