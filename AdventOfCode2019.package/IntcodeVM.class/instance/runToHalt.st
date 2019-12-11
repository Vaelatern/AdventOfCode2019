vm
runToHalt
	"comment stating purpose of message"

	[ (self reelAt: self pc) = 99 ] whileFalse: [ pc := self opcodeExecute + pc ].

	^ self reelAt: 1