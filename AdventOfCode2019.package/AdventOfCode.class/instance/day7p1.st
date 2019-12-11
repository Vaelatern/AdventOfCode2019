problems
day7p1
	"comment stating purpose of message"

	| runAmpProgram tmp rV ampA ampB ampC ampD ampE vms ordered |
	rV := 0.
	runAmpProgram := [ :vm :which :prev | 
	vm
		stdin: which;
		stdin: prev;
		runToHalt;
		reset;
		stdout ].
	ampA := IntcodeVM new reel: input.
	ampB := IntcodeVM new reel: input.
	ampC := IntcodeVM new reel: input.
	ampD := IntcodeVM new reel: input.
	ampE := IntcodeVM new reel: input.
	vms := OrderedCollection new.
	vms add: ampA.
	vms add: ampB.
	vms add: ampC.
	vms add: ampD.
	vms add: ampE.
	'01234'
		permutationsDo: [ :order | 
			tmp := 0.
			ordered := order asOrderedCollection.
			vms
				do:
					[ :vm | tmp := runAmpProgram value: vm value: ordered removeFirst asString asInteger value: tmp ].
			rV := rV max: tmp ].
	^ rV