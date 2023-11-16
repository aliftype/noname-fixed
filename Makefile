all: NoNameFixed-Regular.ttf

export SOURCE_DATE_EPOCH=$(shell stat -c "%Y" NoNameFixed.glyphs)

NoNameFixed-Regular.ttf: NoNameFixed.glyphs
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --output=ttf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops
