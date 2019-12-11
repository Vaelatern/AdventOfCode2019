problems
day8p2draw
	"comment stating purpose of message"

	| vals |
	vals := self day8p2.
	Transcript cr.
	[vals notEmpty ] whileTrue: [Transcript
		show:
			(((vals removeFirst: 25)
				collect: [ :i | 
					i = 1
						ifTrue: [ '#' ]
						ifFalse: [ ' ' ] ]) inject: '' into: [ :s :a | s , a ]);
		cr]