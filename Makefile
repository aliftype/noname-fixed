SHELL=/usr/bin/env bash

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

%.utf: %.ufo
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -u $< --output-path $@              \
	 --optimize-cff 0 --keep-overlaps

%.cff: %.utf
	@echo "  SUBR   $@"
	@tx -cff +S +b $< $@ 2>/dev/null

%.otf: %.cff %.utf
	@echo "  COPY   $@"
	@sfntedit -a CFF=$+ $@
