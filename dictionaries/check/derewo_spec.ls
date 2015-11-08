require! {
	hamjest:{assertThat,equalTo}
	'../lib/derewo':{getBaseForms, rawList, getAbnormalBaseForms}
}

describe 'Derewo raw list' ->
	specify 'discards comments' ->
		assertThat rawList(['#comment']), equalTo []
	specify 'drops frequency class' ->
		assertThat rawList(['foo 0']), equalTo ['foo']
	specify 'drops frequency class and word type' ->
		assertThat rawList(['foo 0 BAR']), equalTo ['foo']
	specify 'drops words not within given frequency class' ->
		assertThat rawList(['foo 1'], maxFrequencyClass: 0), equalTo []

describe 'Derewo base forms' ->
	specify 'come from multiple words in one line' ->
		assertThat getBaseForms(['foo,bar']), equalTo ['foo', 'bar']
	specify 'come from short notation for multiple words' ->
		assertThat getBaseForms(['foo(bar,baz)']), equalTo ['foo', 'foobar', 'foobaz']

describe 'Derewo abnormal base forms' ->
	specify 'come from (.*)e(r,s) entries' ->
		assertThat getAbnormalBaseForms(['<x>e(r,s)']), equalTo ['<x>']

