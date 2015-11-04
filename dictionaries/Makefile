bin := $(shell npm bin)
lsc := $(bin)/lsc

build := build
lib := lib
vendor := vendor
bundle := $(build)/Dictionaries.bundle

derewo_original:=$(vendor)/derewo/derewo-v-ww-bll-320000g-2012-12-31-1.0.txt
morphy := $(vendor)/morphy/morphy-mapping-20110717.csv
$(derewo_original) $(morphy):
	peru sync

derewo_utf:=$(build)/derewo_utf.txt
$(derewo_utf): $(derewo_original)
	mkdir -p $(build)
	iconv -f iso-8859-1 -t utf-8 < $< > $@

german_dict_folder:=$(bundle)/de
german-dictionary: $(derewo_utf) $(morphy)
	mkdir -p $(german_dict_folder)
	$(lsc) $(lib)/generate_de $(german_dict_folder) $^
clean-german-dictionary:
	rm -f $(german_dict_folder)

args =
.PHONY: check
check:
	$(bin)/mocha --compilers ls:LiveScript --recursive check --reporter mocha-unfunk-reporter $(args)



manual-dictionaries:
	ditto manual/*.txt $(bundle)/


bundle: manual-dictionaries german-dictionary

clean:
	rm -r $(build)


clean-build: clean check bundle

.DEFAULT_GOAL := clean-build
