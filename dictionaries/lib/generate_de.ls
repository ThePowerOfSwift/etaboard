require! {
	q
	ramda:r
	'./util': u
	'./derewo'
}

splitLines = r.split('\n')
joinLines = r.join('\n')


[germanDictionaryFile, derewoFile, morphyFile] = process.argv[2 to 4]

isComment = (x) -> x.startsWith('#')

createFormsDictionary = r.pipe(
	r.filter r.complement(isComment)
	r.map (line) ->
		parts = r.split '\t' line
		return
			form: parts[0]
			base: parts[1]
	r.groupBy(r.prop('base'))
	r.mapObj r.map(r.prop('form'))
)

formsByBase = u.readFile morphyFile
	.then splitLines
	.then createFormsDictionary

derewoExcerpt = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 15)

augmentWithForms = (baseForms, additionalForms) ->
	getAllForms = (form) -> r.concat [form] r.defaultTo([], additionalForms[form])
	r.chain(getAllForms)(baseForms)

q [derewoExcerpt, formsByBase]
	.spread augmentWithForms
	.then joinLines
	.then u.writeToFile germanDictionaryFile
	.done()

