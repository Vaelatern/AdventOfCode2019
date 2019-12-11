vm
createOpcodes
	"comment stating purpose of message"

	opcodes := Dictionary new.
	opcodes
		at: 1
		put: [ :firstDirect :secondDirect :thirdDirect | 
			self
				getArg: 3
				relative: thirdDirect
				put:
					(self getArg: 1 relative: firstDirect)
						+ (self getArg: 2 relative: secondDirect).
			4 ].
	opcodes
		at: 2
		put: [ :firstDirect :secondDirect :thirdDirect | 
			self
				getArg: 3
				relative: thirdDirect
				put:
					(self getArg: 1 relative: firstDirect)
						* (self getArg: 2 relative: secondDirect).
			4 ].
	opcodes
		at: 3
		put: [ :firstDirect :secondDirect :thirdDirect | 
			self getArg: 1 relative: firstDirect put: stdin next asInteger.
			2 ].
	opcodes
		at: 4
		put: [ :firstDirect :secondDirect :thirdDirect | 
			| tmp |
			tmp := self getArg: 1 relative: firstDirect.
			stdout nextPut: tmp.
			latestOut := tmp.
			2 ].
	opcodes
		at: 5
		put: [ :firstDirect :secondDirect :thirdDirect | 
			(self getArg: 1 relative: firstDirect) = 0
				ifTrue: [ 3 ]
				ifFalse: [ pc := (self getArg: 2 relative: secondDirect) + 1.
					0 ] ].
	opcodes
		at: 6
		put: [ :firstDirect :secondDirect :thirdDirect | 
			(self getArg: 1 relative: firstDirect) = 0
				ifTrue: [ pc := (self getArg: 2 relative: secondDirect) + 1.
					0 ]
				ifFalse: [ 3 ] ].
	opcodes
		at: 7
		put: [ :firstDirect :secondDirect :thirdDirect | 
			self
				getArg: 3
				relative: thirdDirect
				put:
					((self getArg: 1 relative: firstDirect)
						< (self getArg: 2 relative: secondDirect)
						ifTrue: [ 1 ]
						ifFalse: [ 0 ]).
			4 ].
	opcodes
		at: 8
		put: [ :firstDirect :secondDirect :thirdDirect | 
			self
				getArg: 3
				relative: thirdDirect
				put:
					((self getArg: 1 relative: firstDirect)
						= (self getArg: 2 relative: secondDirect)
						ifTrue: [ 1 ]
						ifFalse: [ 0 ]).
			4 ].
	opcodes
		at: 9
		put: [ :firstDirect :secondDirect :thirdDirect | 
			relbase := relbase + (self getArg: 1 relative: firstDirect).
			2 ]