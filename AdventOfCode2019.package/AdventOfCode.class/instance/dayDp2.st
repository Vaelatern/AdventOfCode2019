problems
dayDp2
	"comment stating purpose of message"

	| latestScore state x y what vm numBlocks ballX paddleX |
	state := Dictionary new.
	latestScore := ballX := paddleX := -1.
	numBlocks := 0.
	vm := (IntcodeVM new reel: input)
		insertArcadeCoins: 2;
		run.
	[ vm halted ]
		whileFalse: [ | p |
			x := vm stdout.
			y := vm stdout.
			what := vm stdout.
			p := x @ y.
			what = 2
				ifTrue: [ numBlocks := numBlocks + 1 ].
			(x = -1 and: y = 0)
				ifTrue: [ latestScore := what ]
				ifFalse: [ state at: p ifAbsentPut: [ -1 ].
					what = 4
						ifTrue: [ ballX := x ].
					what = 3
						ifTrue: [ paddleX := x ].
					(what ~= 2 and: (state at: p) = 2)
						ifTrue: [ numBlocks := numBlocks - 1 ].
					state at: p put: what ].
			(ballX > 0 and: paddleX > 0)
				ifTrue: [ | diffX dirGo |
					diffX := ballX - paddleX.
					dirGo := diffX = 0
						ifTrue: [ 0 ]
						ifFalse: [ diffX > 0
								ifTrue: [ 1 ]
								ifFalse: [ -1 ] ].
					vm stdin: dirGo.

					"Require an update to both before we go again"
					ballX := -1.
					dirGo = 0
						ifFalse: [ paddleX := -1 ] ] ].
	^ latestScore