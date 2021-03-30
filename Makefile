SHELL=/usr/bin/env bash

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

%.otf: %.ufo
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -u $< --output-path $@              \
	 --keep-overlaps
