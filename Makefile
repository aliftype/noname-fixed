all: NoNameFixed-Regular.ttf NoNameFixedTerminal-Regular.ttf

export SOURCE_DATE_EPOCH=$(shell stat -c "%Y" NoNameFixed.glyphs)

NoNameFixedTerminal-Regular.ttf: NoNameFixed.glyphs
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

NoNameFixed-Regular.ttf: NoNameFixed.glyphs
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --output=ttf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops                                   \
		  --master-dir="{tmp}"                                         \
		  --instance-dir="{tmp}"                                       \
		  --no-generate-GDEF
