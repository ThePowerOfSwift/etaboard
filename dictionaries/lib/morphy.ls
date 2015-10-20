require! {
	ramda:r
}

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

module.exports = {
	createFormsDictionary
}
