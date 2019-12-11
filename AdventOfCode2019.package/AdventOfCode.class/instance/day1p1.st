problems
day1p1
	"comment stating purpose of message"

	| listOfNums |
	listOfNums := self input lines collect: [ :x | (x asInteger / 3 roundDownTo: 1) - 2 ].
	^ listOfNums inject: 0 into: [ :a :b | a + b ]