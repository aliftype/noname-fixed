.ONESHELL:

all: NoNameFixed-Regular.otf NoNameFixedTerminal-Regular.otf

NoNameFixedTerminal-Regular.otf: NoNameFixed-Regular.glyphs
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<`
	@fontmake -g $<                                                        \
		  --interpolate=".* Terminal Regular"                          \
		  --output=otf                                                 \
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

NoNameFixed-Regular.otf: NoNameFixed-Regular.glyphs
	@echo "  MAKE   $@"
	@export SOURCE_DATE_EPOCH=`stat -c "%Y" $<`
	@fontmake -g $<                                                        \
		  --output=otf                                                 \
		  --output-path=$@                                             \
		  --verbose=WARNING                                            \
		  --overlaps-backend=pathops                                   \
		  --master-dir="{tmp}"                                         \
		  --instance-dir="{tmp}"                                       \
		  --no-generate-GDEF
