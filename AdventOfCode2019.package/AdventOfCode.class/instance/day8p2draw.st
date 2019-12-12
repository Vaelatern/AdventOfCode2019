problems
day8p2draw
	"comment stating purpose of message"

	| vals g ds y printMap |
	vals := self day8p2 asOrderedCollection.
	y := 10.
	printMap := Dictionary new.
	[ vals notEmpty ]
		whileTrue: [ (vals removeFirst: 25)
				doWithIndex: [ :v :i | printMap at: (i + 25) @ (y + 25) put: v ].
			y := y - 1 ].
	g := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color white.
	ds dotShape size: 10.
	ds points: (printMap select: [ :i | i = 1 ]) keys.
	ds x: #x.
	ds y: #y.
	g add: ds.
	^ g