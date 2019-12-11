problems
day1p2
	"comment stating purpose of message"

	| getFuel |
	getFuel := [ :x | (x / 3 roundDownTo: 1) - 2 ].
	^ (self input lines
		collect: [ :x | 
			| next new |
			new := getFuel value: x asInteger.
			next := new.
			[ (getFuel value: next) > 0 ]
				whileTrue: [ new := new + (getFuel value: next).
					next := getFuel value: next ].
			new ]) inject: 0 into: [ :a :b | a + b ]