vm
runToHalt
	"comment stating purpose of message"

halted := false.
	[ (self reelAt: pc) = 99 ]
		whileFalse: [ pc := self opcodeExecute + pc ].
	halted := true.
	^ self reelAt: 1