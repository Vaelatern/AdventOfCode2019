problems
day7p2
	"comment stating purpose of message"

	| rV ampA ampB ampC ampD ampE |
	ampA := IntcodeVM new reel: input.
	ampB := IntcodeVM new reel: input.
	ampC := IntcodeVM new reel: input.
	ampD := IntcodeVM new reel: input.
	ampE := IntcodeVM new reel: input.
	ampA stdinRaw: ampE stdoutRaw.
	ampB stdinRaw: ampA stdoutRaw.
	ampC stdinRaw: ampB stdoutRaw.
	ampD stdinRaw: ampC stdoutRaw.
	ampE stdinRaw: ampD stdoutRaw.
	rV := 0.
	'56789'
		permutationsDo: [ :order | 
			| ordered |
			ordered := order asOrderedCollection.
			ampA stdin: ordered removeFirst asString asInteger.
			ampA stdin: 0.
			ampB stdin: ordered removeFirst asString asInteger.
			ampC stdin: ordered removeFirst asString asInteger.
			ampD stdin: ordered removeFirst asString asInteger.
			ampE stdin: ordered removeFirst asString asInteger.
			ampA run.
			ampB run.
			ampC run.
			ampD run.
			ampE runToHalt.
			rV := rV max: ampE lastOut.
			ampA reset.
			ampB reset.
			ampC reset.
			ampD reset.
			ampE reset. ].
	^ rV