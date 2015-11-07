require! {
	ramda: r
	hamjest: {hasItems}: __
}

hasWords = ->
	baseMatcher = r.apply __.hasItems, &
	baseMatcher.describeMismatch = (actual, description) ->
		description.append "had not all of the words"
	baseMatcher

notHasWords = ->
	hasNotItem = r.compose __.not, __.hasItem
	individualMatchers = r.map hasNotItem, &
	baseMatcher = r.apply __.allOf, individualMatchers
	baseMatcher.describeMismatch = (actual, description) ->
		description.append "the array contained at least one of the words"
	baseMatcher

compact = (words) ->
	words
	|> r.groupBy r.toLower
	|> r.values
	|> r.chain r.head >> r.toLower


module.exports = {
	hasWords
	notHasWords
	compact
}
