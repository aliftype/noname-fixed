all: fonts/NoNameFixed-Regular.ttf

export SOURCE_DATE_EPOCH=$(shell stat -c "%Y" sources/NoNameFixed.glyphspackage)

fonts/NoNameFixed-Regular.ttf: sources/NoNameFixed.glyphspackage
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --output=ttf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops
