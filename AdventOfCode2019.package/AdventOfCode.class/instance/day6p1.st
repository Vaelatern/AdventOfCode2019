problems
day6p1
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
	^ nodes inject: 0 into: [ :a :b | a + b allChildren ]