require! {
	q
	ramda:r
	'./util': u
	'./derewo'
	'./morphy'
}

splitLines = r.split('\n')
joinLines = r.join('\n')


[germanDictionaryFolder, derewoFile, morphyFile] = process.argv[2 to 4]

getAdditionalFormsByBaseForm = u.readFile morphyFile
	.then splitLines
	.then morphy.createFormsDictionary

getBaseForms = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 12)

augmentWithForms = (baseForms, additionalForms) ->
	getAllFormsForForm = (form) ->
		r.concat [form] r.defaultTo([], additionalForms[form])
	r.chain(getAllFormsForForm)(baseForms)

writeToFilesGroupedByLength = (forms) ->
	writeToFile = (formsForLength, length) ->
		path = "#germanDictionaryFolder/#{length}.txt"
		(u.writeToFile path) (joinLines formsForLength)
	forms
	|> r.groupBy r.length
	|> r.mapObjIndexed writeToFile
	|> r.values
	|> q.all

q [getBaseForms, getAdditionalFormsByBaseForm]
	.spread augmentWithForms
	.then writeToFilesGroupedByLength
	.done()

