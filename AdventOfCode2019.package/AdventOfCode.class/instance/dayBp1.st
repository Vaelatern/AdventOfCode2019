problems
dayBp1
	"comment stating purpose of message"

	| panelsPainted p dir vm |
	panelsPainted := Dictionary new.
	dir := 0 @ 1.
	p := 0 @ 0.
	vm := (IntcodeVM new reel: input) run.
	[ vm halted ]
		whileFalse: [ | nextDir |
			vm stdin: (panelsPainted at: p ifAbsent: 0).
			panelsPainted at: p put: vm stdout.
			nextDir := vm stdout.
			p := p
				+
					(dir := nextDir = 0
						ifTrue: [ dir = (0 @ 1)
								ifTrue: [ -1 @ 0 ]
								ifFalse: [ dir = (-1 @ 0)
										ifTrue: [ 0 @ -1 ]
										ifFalse: [ dir = (0 @ -1)
												ifTrue: [ 1 @ 0 ]
												ifFalse: [ dir = (1 @ 0)
														ifTrue: [ 0 @ 1 ]
														ifFalse: [ nil ] ] ] ] ]
						ifFalse: [ dir = (0 @ 1)
								ifTrue: [ 1 @ 0 ]
								ifFalse: [ dir = (-1 @ 0)
										ifTrue: [ 0 @ 1 ]
										ifFalse: [ dir = (0 @ -1)
												ifTrue: [ -1 @ 0 ]
												ifFalse: [ dir = (1 @ 0)
														ifTrue: [ 0 @ -1 ]
														ifFalse: [ nil ] ] ] ] ]) ].
	^ panelsPainted size