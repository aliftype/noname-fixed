all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

export SOURCE_DATE_EPOCH=$(shell stat -c "%Y" NoNameFixed.glyphs)

NoNameFixedTerminal-Regular.otf: NoNameFixed.glyphs
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --interpolate=".* Terminal Regular"                          \
		  --output=otf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops                                   \
		  --optimize-cff=1                                             \
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

NoNameFixed-Regular.otf: NoNameFixed.glyphs
	@echo "  MAKE   $@"
	@fontmake -g $<                                                        \
		  --output=otf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops                                   \
		  --optimize-cff=1                                             \
		  --master-dir="{tmp}"                                         \
		  --instance-dir="{tmp}"                                       \
		  --no-generate-GDEF
