bin := $(shell npm bin)
lsc := $(bin)/lsc

build := build
lib := lib

derewo_excerpt:=$(build)/derewo.txt
derewo:=temp/derewo-v-ww-bll-320000g-2012-12-31-1.0/derewo-v-ww-bll-320000g-2012-12-31-1.0.txt
derewo_utf:=temp/derewo-v-ww-bll-320000g-2012-12-31-1.0/derewo_utf.txt
$(derewo_utf): $(derewo)
	iconv -f iso-8859-1 -t utf-8 < $< > $@
$(derewo_excerpt): $(derewo_utf)
	mkdir -p $(build)
	$(lsc) $(lib)/generate_derewo_excerpt $< $@
derewo-excerpt: $(derewo_excerpt)
clean-derewo-excerpt:
	rm -f $(derewo_excerpt)

args =
.PHONY: check
check:
	$(bin)/mocha --compilers ls:LiveScript --recursive check --reporter mocha-unfunk-reporter $(args)

