problems
day7p2
	"comment stating purpose of message"

	| rV ampA ampB ampC ampD ampE vms |
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
	vms := Array
		with: ampA
		with: ampB
		with: ampC
		with: ampD
		with: ampE.
	rV := 0.
	'56789'
		permutationsDo: [ :order | 
			| ordered |
			ordered := order asOrderedCollection.
			vms do: [ :i | i stdin: ordered removeFirst asString asInteger ].
			ampA stdin: 0.
			vms
				do: [ :i | 
					i == ampE
						ifTrue: [ i runToHalt ]
						ifFalse: [ i run ] ].
			rV := rV max: ampE latestOut.
			vms do: [ :i | i reset ] ].
	^ rV