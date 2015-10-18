require! {
	hamjest:{assertThat,equalTo}
	'../lib/derewo':{excerpt}
}

describe 'Derewo excerpt' ->
	specify 'discards comments' ->
		assertThat excerpt(['#comment']), equalTo []
	specify 'splits multiple words' ->
		assertThat excerpt(['foo,bar']), equalTo ['foo', 'bar']
	specify 'drops frequency class' ->
		assertThat excerpt(['foo 0']), equalTo ['foo']
	specify 'drops frequency class and word type' ->
		assertThat excerpt(['foo 0 BAR']), equalTo ['foo']
	specify 'expands short notation for multiple words' ->
		assertThat excerpt(['foo(bar,baz)']), equalTo ['foobar', 'foobaz']
	specify 'drops words not within given frequency class' ->
		assertThat excerpt(['foo 1'], maxFrequencyClass: 0), equalTo []

