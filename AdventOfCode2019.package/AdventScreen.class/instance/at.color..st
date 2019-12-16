accessing
at: point color: c
	"comment stating purpose of message"

	| col |
	col := c.
	c isInteger
		ifTrue: [ col := c = 1
				ifTrue: [ Color white ]
				ifFalse: [ Color black ] ].
	rawPositions at: point put: col.
	self normalizePositions.
	self changed