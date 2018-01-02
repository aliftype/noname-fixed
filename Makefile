all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

%.otf: %.ufo
	@echo "  MAKE   $@"
	@cd `mktemp -d` ;                                                      \
	  fontmake --verbose WARNING                                           \
	           --no-subroutinize                                           \
	           --keep-overlaps                                             \
	           -o otf                                                      \
	           -u ~-/$<                                                    \
	           ;                                                           \
	  cp master_otf/$@ ~-/$@ ;                                             \
	 cd - ;                                                                \
	 rm -rf ~-

