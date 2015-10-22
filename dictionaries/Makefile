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

german_dict:=$(bundle)/de.txt
$(german_dict): $(derewo_utf) $(morphy)
	mkdir -p $(build)
	$(lsc) $(lib)/generate_de $@ $^
german-dictionary: $(german_dict)
clean-german-dictionary:
	rm -f $(german_dict)

args =
.PHONY: check
check:
	$(bin)/mocha --compilers ls:LiveScript --recursive check --reporter mocha-unfunk-reporter $(args)



manual-dictionaries:
	ditto manual/*.txt $(bundle)/


bundle: manual-dictionaries german-dictionary

clean:
	rm -r $(build)

