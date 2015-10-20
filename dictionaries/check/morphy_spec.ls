require! {
	hamjest:{assertThat,equalTo,isEmpty}
	'../lib/morphy':{createFormsDictionary}
}

describe 'Morphy processing' ->
	specify 'discards comments' ->
		assertThat createFormsDictionary(['#comment']), isEmpty()
	specify 'groups forms by base form' ->
		assertThat createFormsDictionary(['foo1\tfoo' 'foo2\tfoo' 'bar\tbar']),
			equalTo {
				foo: ['foo1' 'foo2']
				bar: ['bar']
			}
