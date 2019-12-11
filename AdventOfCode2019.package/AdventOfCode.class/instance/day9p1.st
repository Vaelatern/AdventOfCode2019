problems
day9p1
	"comment stating purpose of message"

	^ (IntcodeVM new reel: input)
		stdin: '1';
		runToHalt;
		stdout