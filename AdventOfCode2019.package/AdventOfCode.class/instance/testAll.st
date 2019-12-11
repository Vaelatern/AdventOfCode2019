tests
testAll
	"comment stating purpose of message"

	| assert allTests doTest |
	assert := [ :aBlock | 
	aBlock value
		ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ].
	doTest := [ :key :value | 
	assert
		value: [ (self
				input: (self perform: value first);
				perform: key) = value second ] ].
	allTests := 
	(Dictionary new)
		at: #day1p1 put: #(#Day1input 3363033);
		at: #day1p2 put: #(#Day1input 5041680);
		at: #day2p1 put: #(#Day2input 3085697);
		at: #day2p2 put: #(#Day2input 9425);
		at: #day3p1 put: #(#Day3input 2193);
		at: #day3p2 put: #(#Day3input 63526);
		at: #day4p1 put: #(#Day4input 1864);
		at: #day4p2 put: #(#Day4input 1258);
		at: #day5p1 put: #(#Day5input #(0 0 0 0 0 0 0 0 0 5577461));
		at: #day5p2 put: #(#Day5input 7161591);
		at: #day6p1 put: #(#Day6input 358244);
		at: #day6p2 put: #(#Day6input 517);
		at: #day7p1 put: #(#Day7input 30940);
		at: #day7p2 put: #(#Day7input 76211147);
		at: #day8p1 put: #(#Day8input 2032);
		at: #day8p2
			put:
			#(#Day8input #(0 1 1 0 0 1 1 1 1 0 0 1 1 0 0 1 0 0 1 0 0 1 1 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 0 0 0 1 1 1 0 0 1 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 0 1 0 1 1 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 0 1 1 0 0 1 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 0));
		at: #day9p1 put: #(#Day9input 3518157894);
		at: #day9p2 put: #(#Day9input 80379);
		at: #dayAp1 put: #(#DayAinput 309);
		at: #dayAp2 put: #(#DayAinput 416);
		yourself.
	allTests keysAndValuesDo: doTest.
	^ 'Every test passes'