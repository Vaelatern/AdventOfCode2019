problems
day2p1
	"comment stating purpose of message"

	^ (IntcodeVM new reel: (self Day2input))
		restoreFrom1202;
		runToHalt