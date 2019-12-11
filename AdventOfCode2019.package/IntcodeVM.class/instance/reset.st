vm
reset
	"comment stating purpose of message"

	pc := 1.
	reel := unusedReel copy.
	[stdin isEmpty] whileFalse: [ stdin next ].