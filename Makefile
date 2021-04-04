SHELL=/usr/bin/env bash

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

NoNameFixedTerminal-Regular.otf: NoNameFixed-Regular.glyphs
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -g $< --output-path $@              \
	 --overlaps-backend=pathops --master-dir="{tmp}" --instance-dir="{tmp}"\
	 --no-generate-GDEF -i ".* Terminal Regular"
	@fonttools subset --unicodes='*' --name-IDs='*' --notdef-outline       \
	 --drop-tables+=GDEF,GSUB,GPOS --recalc-average-width --recalc-bounds  \
	 --recalc-max-context --output-file=$@.s $@ && mv $@.s $@

NoNameFixed-Regular.otf: NoNameFixed-Regular.glyphs
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<` &&                         \
	 fontmake --verbose WARNING -o otf -g $< --output-path $@              \
	 --overlaps-backend=pathops --master-dir="{tmp}" --instance-dir="{tmp}"\
	 --no-generate-GDEF
