require! {
	hamjest: {assertThat}: __
	'../lib/dictionary'
}

describe 'hasWords matcher' ->
	describe 'for one word' ->
		var matcher
		beforeEach ->
			matcher := dictionary.hasWords('foo')

		specify 'matches when the word is there' ->
			assertThat matcher, __.matches ['foo']
		specify 'fails to match the word is missing' ->
			assertThat matcher, __.failsToMatch []

	describe 'for multiple words' ->
		var matcher
		beforeEach ->
			matcher := dictionary.hasWords('foo', 'bar')

		specify 'matches when both words are there' ->
			assertThat matcher, __.matches ['foo', 'bar']
		specify 'fails to match when either of the words are missing' ->
			assertThat matcher, __.failsToMatch ['foo']
			assertThat matcher, __.failsToMatch ['bar']
			assertThat matcher, __.failsToMatch []


describe 'notHasWords matcher' ->
	describe 'for one word' ->
		var matcher
		beforeEach ->
			matcher := dictionary.notHasWords('foo')

		specify 'matches when the word is missing' ->
			assertThat matcher, __.matches []
		specify 'fails to match when the word is there' ->
			assertThat matcher, __.failsToMatch ['foo']

	describe 'for multiple words' ->
		var matcher
		beforeEach ->
			matcher := dictionary.notHasWords('foo', 'bar')

		specify 'matches when both words are missing' ->
			assertThat matcher, __.matches []
		specify 'fails to match when either word is there' ->
			assertThat matcher, __.failsToMatch ['foo']
			assertThat matcher, __.failsToMatch ['bar']
			assertThat matcher, __.failsToMatch ['foo', 'bar']


describe 'compact' ->
	specify 'removes capitalized duplicate that comes second' ->
		assertThat dictionary.compact(['foo', 'Foo']), __.equalTo ['foo']
	specify 'removes capitalized duplicate that comes first' ->
		assertThat dictionary.compact(['Foo', 'foo']), __.equalTo ['foo']

