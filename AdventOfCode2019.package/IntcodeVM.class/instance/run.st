vm
run
	"comment stating purpose of message"

	[ [ (reel at:  pc) = 99 ]
		whileFalse: [ pc := self opcodeExecute + pc ] ] fork