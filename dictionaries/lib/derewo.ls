require! {
	ramda:r
}

isComment = (x) -> x.startsWith('#')

prependString = (prefix, suffix) --> prefix + suffix

expandShortNotation = (shortForm) ->
	matches = shortForm.match /(.+)\((.+)\)/
	if not matches then return [shortForm]

	prefix = matches[1]
	suffixesAsOneString = matches[2]
	return suffixesAsOneString
		|> r.split(',')
		|> r.prepend ''
		|> r.map(prependString(prefix))

fitsFrequencyClass = (maxFrequencyClass, entry) -->
	parts = r.split(' ') entry
	if parts.length < 2 then return true
	return parts[1] <= maxFrequencyClass

dropFrequencyClassAndWordType = r.split(' ') >> r.head

expandMultipleWords = r.split(',')

excerpt = (derewoEntries, {maxFrequencyClass}={maxFrequencyClass: 0}) ->
	r.pipe(
		r.filter r.complement(isComment)
		r.filter fitsFrequencyClass(maxFrequencyClass)
		r.map dropFrequencyClassAndWordType
		r.chain expandShortNotation
		r.chain expandMultipleWords
	) derewoEntries

module.exports = {
	excerpt
}

