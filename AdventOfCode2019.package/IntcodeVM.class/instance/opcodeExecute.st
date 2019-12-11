vm
opcodeExecute
	"comment stating purpose of message"

	| opcode |
	opcode := reel at: pc.
	^ (opcodes
		at: opcode \\ 100
		ifAbsent: [ [ :a :b :c | 
			Transcript
				show: 'Can not print opcode ';
				show: opcode asString;
				show: ' with pc = ';
				show: pc asString;
				cr.
			pc * -1 ] ])
		value: opcode \\ 1000 // 100
		value: opcode \\ 10000 // 1000
		value: opcode \\ 100000 // 10000