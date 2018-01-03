SHELL=/usr/bin/env bash

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

%.otf: %.ufo
	@echo "  MAKE   $@"
	@cd `mktemp -d` &&                                                     \
	  export SOURCE_DATE_EPOCH=`stat -c "%Y" ~-/$<` &&                     \
	  fontmake --verbose WARNING                                           \
	           -o otf                                                      \
	           -u ~-/$<                                                    \
	           &&                                                          \
	  cp master_otf/$@ ~-/$@ &&                                            \
	 cd - &>/dev/null &&                                                   \
	 rm -rf ~-

