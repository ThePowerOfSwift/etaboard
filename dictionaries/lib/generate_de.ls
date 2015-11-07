require! {
	path
	q
	ramda: r
	'./util': u
	'./derewo'
	'./morphy'

	hamjest: {assertThat}
	'./dictionary': {hasWords, hasNoWords}
}

splitLines = r.split('\n')
joinLines = r.join('\n')

mergeBaseFormsWithAdditionalForms = (baseForms, additionalFormsByBaseForm) ->
	getAllFormsForForm = (form) ->
		r.concat [form] r.defaultTo([], additionalFormsByBaseForm[form])
	r.chain(getAllFormsForForm)(baseForms)

writeToFilesGroupedByLength = (forms) ->
	writeToFile = (formsForLength, length) ->
		filePath = path.join germanDictionaryFolder, "#{length}.txt"
		(u.writeToFile filePath) (joinLines formsForLength)
	forms
	|> r.groupBy r.length
	|> r.mapObjIndexed writeToFile
	|> r.values
	|> q.all


verifyDictionaryContents = (words) ->
	assertThat words, (hasWords 'jede')
	assertThat words, (hasNoWords 'xxx')
	words



[germanDictionaryFolder, derewoFile, morphyFile] = process.argv[2 to 4]

getAdditionalFormsByBaseForm = u.readFile morphyFile
	.then splitLines
	.then morphy.createFormsDictionary

getBaseForms = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 15)

q [getBaseForms, getAdditionalFormsByBaseForm]
	.spread mergeBaseFormsWithAdditionalForms
	.then verifyDictionaryContents
	.then writeToFilesGroupedByLength
	.done()

