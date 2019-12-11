problems
day9p2
	"comment stating purpose of message"

	^ (IntcodeVM new reel: input)
		stdin: '2';
		runToHalt;
		stdout