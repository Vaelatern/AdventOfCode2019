problems
dayDp1
	"comment stating purpose of message"

|rV|
rV := 0.
	((IntcodeVM new reel: input)
		runToHalt;
		stdoutFlush) doWithIndex: [ :v :i | (i \\ 3 = 0 and: v = 2) ifTrue:[rV := rV + 1]].
		^ rV