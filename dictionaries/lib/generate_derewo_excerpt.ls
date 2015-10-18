require! {
	q
	ramda:r
	'./util': u
	'./derewo'
}

splitLines = r.split('\n')
joinLines = r.join('\n')




[source, sink] = process.argv[2, 3]


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

formsByBase = u.readFile 'temp/morphy-mapping-20110717/morphy-mapping-20110717.csv'
	.then splitLines
	.then createFormsDictionary

derewoExcerpt = u.readFile source
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 15)

augmentWithForms = (baseForms, additionalForms) ->
	getAllForms = (form) -> r.concat [form] r.defaultTo([], additionalForms[form])
	r.chain(getAllForms)(baseForms)

q [derewoExcerpt, formsByBase]
	.spread augmentWithForms
	.then joinLines
	.then u.writeToFile sink
	.done()

