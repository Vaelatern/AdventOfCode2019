tests
testAll
	"For all tests, even the slow ones"

	| assert |
	assert := [ :aBlock | 
	aBlock value
		ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ].
	self testMost.
	assert
		value: [ (self
				input: self day3input;
				day3p2) = 63526 ].
	assert
		value: [ (self
				input: self dayCinput;
				dayCp2) = 362375881472136 ].
	^ 'Every test passes'