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
character_distance:=Source/KeyboardExtension/suggester/CharacterDistance.swift
generate-character-distances:
	rm -f $(character_distance)
	cat $(helpers)/String+split.swift $(model)/ConcreteLayout.swift $(model)/SchematicLayout.swift $(suggester)/CharacterDistanceGenerator.swift | swift - > $(character_distance)

generate-code: generate-character-distances

.PHONY: dictionaries
dictionaries:
	$(MAKE) -C $@

test: generate-code
	xcodebuild test -scheme EtaBoard -destination 'name=iPhone 6'

clean:
	xcodebuild clean

.PHONY: build
build: generate-code
	xcodebuild build

release: clean test generate-code dictionaries bump-build-number
	xcodebuild archive -scheme EtaBoard

test-build-chain: clean build test bump-build-number
	echo "You might want to revert the version bump."
