testing
hasDescendentByName: who
	"comment stating purpose of message"

	| parents |
	^ memoizedDescendentNames
		at: who
		ifAbsentPut: [ myName = who
				ifTrue: [ 1 ]
				ifFalse: [ parents := children select: [ :i | (i hasDescendentByName: who) > 0 ].
					parents isEmpty
						ifTrue: [ 0 ]
						ifFalse: [ 1 + ((parents at: 1) hasDescendentByName: who) ] ] ]