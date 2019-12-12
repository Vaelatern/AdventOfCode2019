vm
run
	"comment stating purpose of message"

	halted := false.
	[ [ (reel at: pc) = 99 ]
		whileFalse: [ pc := self opcodeExecute + pc ].
	halted := true.
	stdout signalNoMoreItems] fork