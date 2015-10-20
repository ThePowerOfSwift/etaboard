require! {
	q
	ramda:r
	'./util': u
	'./derewo'
	'./morphy'
}

splitLines = r.split('\n')
joinLines = r.join('\n')


[germanDictionaryFile, derewoFile, morphyFile] = process.argv[2 to 4]

getAdditionalFormsByBaseForm = u.readFile morphyFile
	.then splitLines
	.then morphy.createFormsDictionary

getBaseForms = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 11)

augmentWithForms = (baseForms, additionalForms) ->
	getAllFormsForForm = (form) ->
		r.concat [form] r.defaultTo([], additionalForms[form])
	r.chain(getAllFormsForForm)(baseForms)

q [getBaseForms, getAdditionalFormsByBaseForm]
	.spread augmentWithForms
	.then joinLines
	.then u.writeToFile germanDictionaryFile
	.done()

