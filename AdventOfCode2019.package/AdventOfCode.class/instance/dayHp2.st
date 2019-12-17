problems
dayHp2
	"comment stating purpose of message"

	| rV |
	rV := (IntcodeVM new reel: input)
		insertArcadeCoins: 2;
		stdinArray: ('A,B,A,B,C,C,B,A,C,A' , Character lf asString) asArray;
		stdinArray: ('L,10,R,8,R,6,R,10' , Character lf asString) asArray;
		stdinArray: ('L,12,R,8,L,12' , Character lf asString) asArray;
		stdinArray: ('L,10,R,8,R,8' , Character lf asString) asArray;
		stdinArray: ('y' , Character lf asString) asArray;
		runToHalt;
		stdoutFlush.
	^ rV