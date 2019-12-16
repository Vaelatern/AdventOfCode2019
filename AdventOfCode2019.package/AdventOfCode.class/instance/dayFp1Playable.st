problems
dayFp1Playable
	"comment stating purpose of message"

	| vm screen playerPos handleReturn handler wasWanted moves |
	playerPos := 0 @ 0.
	wasWanted := false.
	moves := 0.
	vm := (IntcodeVM new reel: input) run.
	screen := AdventScreen new.
	screen at: 0 @ 0 color: Color blue.
	screen bitSizes: 10.
	handleReturn := [ :ret :npos | 
	ret = 0
		ifTrue: [ screen at: npos color: Color red ]
		ifFalse: [ moves := moves + 1.
			screen
				at: playerPos
				color:
					(wasWanted
						ifTrue: [ wasWanted := false.
							Color green ]
						ifFalse: [ Color gray ]).
			playerPos := npos.
			screen
				at: playerPos
				color:
					(ret = 1
						ifTrue: [ Color blue ]
						ifFalse: [ wasWanted := true.
							Color green ]) ] ].
	handler := [ :v :modX :modY | 
	[ | returned nextPos |
	vm stdin: v.
	returned := vm stdout.
	nextPos := (playerPos x + modX) @ (playerPos y + modY).
	handleReturn value: returned value: nextPos.] ].
	screen onDown: (handler value: 2 value: 0 value: -1).
	screen onUp: (handler value: 1 value: 0 value: 1).
	screen onLeft: (handler value: 3 value: -1 value: 0).
	screen onRight: (handler value: 4 value: 1 value: 0).
	screen openInWorld