SHELL=/usr/bin/env bash

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

%.otf: %.glyphs
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -g $< --output-path $@              \
	 --overlaps-backend=pathops --master-dir="{tmp}" --instance-dir="{tmp}"

%.otf: %.ufo
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -u $< --output-path $@              \
	 --overlaps-backend=pathops
