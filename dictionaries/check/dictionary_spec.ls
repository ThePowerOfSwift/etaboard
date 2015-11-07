require! {
	hamjest: {assertThat}: _
	'../lib/dictionary'
}

describe 'hasWords matcher' ->
	describe 'for one word' ->
		var matcher
		beforeEach ->
			matcher := dictionary.hasWords('foo')

		specify 'matches when the word is there' ->
			assertThat matcher, _.matches ['foo']
		specify 'fails to match the word is missing' ->
			assertThat matcher, _.failsToMatch []

	describe 'for multiple words' ->
		var matcher
		beforeEach ->
			matcher := dictionary.hasWords('foo', 'bar')

		specify 'matches when both words are there' ->
			assertThat matcher, _.matches ['foo', 'bar']
		specify 'fails to match when either of the words are missing' ->
			assertThat matcher, _.failsToMatch ['foo']
			assertThat matcher, _.failsToMatch ['bar']
			assertThat matcher, _.failsToMatch []


describe 'notHasWords matcher' ->
	describe 'for one word' ->
		var matcher
		beforeEach ->
			matcher := dictionary.notHasWords('foo')

		specify 'matches when the word is missing' ->
			assertThat matcher, _.matches []
		specify 'fails to match when the word is there' ->
			assertThat matcher, _.failsToMatch ['foo']

	describe 'for multiple words' ->
		var matcher
		beforeEach ->
			matcher := dictionary.notHasWords('foo', 'bar')

		specify 'matches when both words are missing' ->
			assertThat matcher, _.matches []
		specify 'fails to match when either word is there' ->
			assertThat matcher, _.failsToMatch ['foo']
			assertThat matcher, _.failsToMatch ['bar']
			assertThat matcher, _.failsToMatch ['foo', 'bar']
