plist := /usr/libexec/PlistBuddy -c

container_info := 'Source/ContainerApp/Info.plist'
extension_info := 'Source/KeyboardExtension/helpers/Info.plist'

old_build_number:=$(shell $(plist) 'Print CFBundleVersion' $(container_info))
new_build_number:=$(shell echo $(old_build_number)+1 | bc)

bump-build-number:
	$(plist) 'Set :CFBundleVersion $(new_build_number)' $(container_info)
	$(plist) 'Set :CFBundleVersion $(new_build_number)' $(extension_info)


extension:=Source/KeyboardExtension
helpers:=$(extension)/helpers
model:=$(extension)/keyboard/model
suggester:=Source/KeyboardExtension/suggester
key_distance:=Source/KeyboardExtension/suggester/KeyDistance.swift
generate-key-distances:
	rm -f $(key_distance)
	cat $(helpers)/String+split.swift $(model)/ConcreteLayout.swift $(model)/SchematicLayout.swift $(suggester)/KeyDistanceGenerator.swift | swift - > $(key_distance)

dictionaries:=$(extension)/dictionaries
derewo_excerpt:=$(dictionaries)/derewo.txt
generate-derewo:
	rm -f $(derewo_excerpt)
	cat $(helpers)/String+split.swift $(dictionaries)/DerewoExcerpt.swift $(dictionaries)/DerewoImporter.swift | swift - temp/derewo-v-ww-bll-320000g-2012-12-31-1.0/derewo-v-ww-bll-320000g-2012-12-31-1.0.txt > $(derewo_excerpt) 15

test:
	xcodebuild test -scheme EtaBoard -destination 'name=iPhone 6'

clean:
	xcodebuild clean

.PHONY: build
build:
	xcodebuild build

release: clean test bump-build-number
	xcodebuild archive -scheme EtaBoard

test-build-chain: clean build test bump-build-number
	echo "You might want to revert the version bump."
