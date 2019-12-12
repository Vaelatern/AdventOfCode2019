tests
testAll
	"comment stating purpose of message"

	| assert |
	assert := [ :aBlock | 
	aBlock value
		ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ].
	assert
		value: [ (self
				input: self Day1input;
				day1p1) = 3363033 ].
	assert
		value: [ (self
				input: self Day1input;
				day1p2) = 5041680 ].
	assert
		value: [ (self
				input: self Day2input;
				day2p1) = 3085697 ].
	assert
		value: [ (self
				input: self Day2input;
				day2p2) = 9425 ].
	assert
		value: [ (self
				input: self Day3input;
				day3p1) = 2193 ].
	assert
		value: [ (self
				input: self Day3input;
				day3p2) = 63526 ].
	assert
		value: [ (self
				input: self Day4input;
				day4p1) = 1864 ].
	assert
		value: [ (self
				input: self Day4input;
				day4p2) = 1258 ].
	assert
		value: [ (self
				input: self Day5input;
				day5p1) = #(0 0 0 0 0 0 0 0 0 5577461) ].
	assert
		value: [ (self
				input: self Day5input;
				day5p2) = 7161591 ].
	assert
		value: [ (self
				input: self Day6input;
				day6p1) = 358244 ].
	assert
		value: [ (self
				input: self Day6input;
				day6p2) = 517 ].
	assert
		value: [ (self
				input: self Day7input;
				day7p1) = 30940 ].
	assert
		value: [ (self
				input: self Day7input;
				day7p2) = 76211147 ].
	assert
		value: [ (self
				input: self Day8input;
				day8p1) = 2032 ].
	assert
		value: [ (self
				input: self Day8input;
				day8p2)
				=
					#(0 1 1 0 0 1 1 1 1 0 0 1 1 0 0 1 0 0 1 0 0 1 1 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 0 0 0 1 1 1 0 0 1 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 0 1 0 1 1 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 0 1 1 0 0 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 0) ].
	assert
		value: [ (self
				input: self Day9input;
				day9p1) = 3518157894 ].
	assert
		value: [ (self
				input: self Day9input;
				day9p2) = 80379 ].
	assert
		value: [ (self
				input: self DayAinput;
				dayAp1) = 309 ].
	assert
		value: [ (self
				input: self DayAinput;
				dayAp2) = 416 ].
	assert
		value: [ (self
				input: self DayBinput;
				dayBp1) = 2082 ].
	assert
		value: [ (self
				input: self DayBinput;
				dayBp2) = (self class classVarNamed: #TestResultBp2) ].
	assert
		value: [ (self
				input: self DayCinput;
				dayCp1) = 8044 ].
			assert
		value: [ (self
				input: self DayCinput;
				dayCp2) = 362375881472136 ].
	^ 'Every test passes'