problems
day2p1
	"comment stating purpose of message"

	^ (IntcodeVM new reel: input)
		restoreFrom1202;
		runToHalt