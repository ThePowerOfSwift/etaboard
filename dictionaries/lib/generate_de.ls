require! {
	path
	q
	ramda: r
	'./util': u
	'./derewo'
	'./morphy'

	hamjest: {assertThat}
	'./dictionary': {hasWords, notHasWords, compact}
}

splitLines = r.split('\n')
joinLines = r.join('\n')
concatAll = r.reduce r.concat, []

getAdditionalFormsForForms = (baseForms, additionalFormsByBaseForm) ->
	getAllFormsForForm = -> r.defaultTo([], additionalFormsByBaseForm[it])
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
	assertThat words, (hasWords 'jede' 'Tag', 'jedem')
	assertThat words, (notHasWords 'Essen')
	words


[germanDictionaryFolder, derewoFile, morphyFile] = process.argv[2 to 4]

rawList = u.readFile derewoFile
	.then splitLines
	.then r.flip(derewo.rawList)(maxFrequencyClass: 16)

normalBaseForms = rawList.then derewo.getBaseForms
abnormalBaseForms = rawList.then derewo.getAbnormalBaseForms

additionalFormsByBaseForm = u.readFile morphyFile
	.then splitLines
	.then morphy.createFormsDictionary

getAdditionalForms = (baseForms) ->
	q.all [baseForms, additionalFormsByBaseForm]
		.spread getAdditionalFormsForForms


q.all [
	normalBaseForms
	getAdditionalForms(normalBaseForms)
	getAdditionalForms(abnormalBaseForms)
]
.then concatAll
.then compact
.then verifyDictionaryContents
.then writeToFilesGroupedByLength
.done()

