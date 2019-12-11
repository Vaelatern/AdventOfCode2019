problems
day6p2
	"comment stating purpose of message"

	| nodes |
	nodes := Dictionary new.
	input lines
		do: [ :line | 
			nodes at: (')' split: line) first put: (GraphNode new myName: (')' split: line) first).
			nodes
				at: (')' split: line) second
				put: (GraphNode new myName: (')' split: line) second) ].
	input lines
		do:
			[ :line | (nodes at: (')' split: line) first) orbitedBy: (nodes at: (')' split: line) second) ].
	^ ((nodes
		select: [ :a | (a hasDescendentByName: 'YOU') > 0 and: [ (a hasDescendentByName: 'SAN') > 0 ] ])
		collect: [ :a | (a hasDescendentByName: 'YOU') + (a hasDescendentByName: 'SAN') - 4 ]) min