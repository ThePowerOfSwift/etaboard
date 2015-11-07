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
$(german_dict_folder): $(derewo_utf) $(morphy)
	mkdir -p $(german_dict_folder)
	$(lsc) $(lib)/generate_de $(german_dict_folder) $^
german-dictionary: $(german_dict_folder)
clean-german-dictionary:
	rm -rf $(german_dict_folder)

args =
precheck:
	$(bin)/mocha --compilers ls:LiveScript --recursive check --reporter mocha-unfunk-reporter $(args)


.PHONY: check
check:
	./check/bundle/german_dictionary.sh


manual-dictionaries:
	ditto manual/*.txt $(bundle)/


bundle: manual-dictionaries german-dictionary

all: precheck bundle check

clean:
	rm -rf $(build)




deps:
	bpkg install lehmannro/assert.sh@v1.1
node_modules:
	npm i
configure: deps node_modules


.DEFAULT_GOAL := all
