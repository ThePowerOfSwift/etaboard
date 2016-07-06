fastlane := bundle exec fastlane


###############
# Main actions
###############

beta: dictionaries-from-scratch generate-code precheck
	$(fastlane) beta

precheck: generate-code
	$(fastlane) test


################
# Generate code
################

extension:=Source/KeyboardExtension
helpers:=$(extension)/helpers
model:=$(extension)/keyboard/model
suggester:=Source/KeyboardExtension/suggester
character_distance:=Source/KeyboardExtension/suggester/CharacterDistance.swift
generate-character-distances:
	rm -f $(character_distance)
	cat $(extension)/Distance.swift $(helpers)/String+.swift $(helpers)/Character+.swift $(model)/ConcreteLayout.swift $(model)/SchematicLayout.swift $(suggester)/CharacterDistanceGenerator.swift | swift - > $(character_distance)

generate-code: generate-character-distances


###############
# Dictionaries
###############

dictionaries := $(MAKE) -C dictionaries
dictionaries-from-scratch:
	$(dictionaries) clean all


###############
# Dependencies
###############

tools:
	bundle install

dependencies:
	carthage bootstrap --platform iOS
update-dependencies:
	carthage update --platform iOS
clean-dependencies:
	rm -rf Carthage
configure: dependencies tools
	$(dictionaries) configure

