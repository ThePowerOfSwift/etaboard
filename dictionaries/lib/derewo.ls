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

rawList = (derewoEntries, {maxFrequencyClass}={maxFrequencyClass: 0}) ->
	r.pipe(
		r.filter r.complement(isComment)
		r.filter fitsFrequencyClass(maxFrequencyClass)
		r.map dropFrequencyClassAndWordType
		) derewoEntries

getBaseForms = r.pipe(
	r.chain expandShortNotation
	r.chain expandMultipleWords
	)

toAbnormalBaseForm = r.pipe(
	r.match /(.+)e\(r,s\)/
	r.tail
	r.head
)
getAbnormalBaseForms = r.pipe(
	r.filter (-> it.endsWith 'e(r,s)')
	r.map toAbnormalBaseForm
	)

module.exports = {
	rawList
	getBaseForms
	getAbnormalBaseForms
	}

