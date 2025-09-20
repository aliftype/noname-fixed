all: fonts/NoNameFixed-Regular.ttf fonts/NoNameFixedTerminal-Regular.ttf

export SOURCE_DATE_EPOCH=$(shell stat -c "%Y" sources/NoNameFixed.glyphspackage)

fonts/NoNameFixed-Regular.ttf: sources/NoNameFixed.glyphspackage
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --output=ttf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops

fonts/NoNameFixedTerminal-Regular.ttf: sources/NoNameFixed.glyphspackage
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --interpolate=".* Terminal Regular"                          \
		  --output=ttf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops                                   \
		  --master-dir="{tmp}"                                         \
		  --instance-dir="{tmp}"                                       \
		  --no-generate-GDEF
	@fonttools subset                                                      \
		  --unicodes='*'                                               \
		  --name-IDs='*'                                               \
		  --notdef-outline                                             \
		  --drop-tables+=GDEF,GSUB,GPOS                                \
		  --recalc-bounds                                              \
		  --recalc-max-context                                         \
		  --recalc-average-width                                       \
		  --output-file=$@.s $@
	 @mv $@.s $@
