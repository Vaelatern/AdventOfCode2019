problems
dayBp2draw
	"comment stating purpose of message"

	| in lowestX lowestY printMap screen |
	in := self dayBp2.
	lowestX := (in keys collect: [ :i | i x ]) min.
	lowestY := (in keys collect: [ :i | i y ]) min.
	printMap := Dictionary new.
	in
		keysAndValuesDo: [ :k :v | printMap at: (k + (lowestX abs @ lowestY abs)) put: v ].
	screen := AdventScreen new.
	printMap keysAndValuesDo: [ :k :v | screen at: k color: v ].
	screen openInWorld