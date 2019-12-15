problems
day8p2draw
	"comment stating purpose of message"

	| vals screen y printMap |
	vals := self day8p2 asOrderedCollection.
	y := 6.
	printMap := Dictionary new.
	[ vals notEmpty ]
		whileTrue: [ (vals removeFirst: 25)
				doWithIndex: [ :v :i | printMap at: i @ y put: v ].
			y := y - 1 ].
	screen := AdventScreen new.
	printMap keysAndValuesDo: [ :k :v | screen at: k color: v ].
	screen openInWorld 