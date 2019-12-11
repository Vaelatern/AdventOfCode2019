problems
day5p2
	"comment stating purpose of message"

	^ (IntcodeVM new reel: input)
		stdin:
			'5';
		runToHalt;
		stdout