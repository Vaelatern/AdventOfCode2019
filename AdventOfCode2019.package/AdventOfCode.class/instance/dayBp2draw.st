problems
dayBp2draw
	"comment stating purpose of message"

	| in lowestX lowestY printMap g ds |
	in := self dayBp2.
	lowestX := (in keys collect: [ :i | i x ]) min.
	lowestY := (in keys collect: [ :i | i y ]) min.
	printMap := Dictionary new.
	in
		keysAndValuesDo:
			[ :k :v | printMap at: (k + (25 @ 25) + (lowestX abs @ lowestY abs)) * 2 put: v ].
	g := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color white.
	ds dotShape size: 10.
	ds points: (printMap select: [ :i | i = 1 ]) keys.
	ds x: #x.
	ds y: #y.
	g add: ds.
	^ g