require! {
	path
	q
	ramda: r
	'./util': u
	'./derewo'
	'./morphy'
	hamjest: {assertThat, hasItems}
}

splitLines = r.split('\n')
joinLines = r.join('\n')

hasWords = (words) ->
	baseMatcher = hasItems(words)
	baseMatcher.describeMismatch = (actual, description) ->
		description.append "had #{r.length actual} other words"
	baseMatcher

[germanDictionaryFolder, derewoFile, morphyFile] = process.argv[2 to 4]

getAdditionalFormsByBaseForm = u.readFile morphyFile
	.then splitLines
	.then morphy.createFormsDictionary

getBaseForms = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.excerpt)(maxFrequencyClass: 15)

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
	words

q [getBaseForms, getAdditionalFormsByBaseForm]
	.spread mergeBaseFormsWithAdditionalForms
	.then verifyDictionaryContents
	.then writeToFilesGroupedByLength
	.done()

