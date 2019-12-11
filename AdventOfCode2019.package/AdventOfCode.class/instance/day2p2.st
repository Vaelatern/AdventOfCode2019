problems
day2p2
	"comment stating purpose of message"

	| vm |
	vm := IntcodeVM new reel: input.
	0 to: 99 do: [ :noun | 
		0 to: 99 do: [ :verb | 
			(vm
				noun: noun verb: verb;
				runToHalt) = 19690720
				ifTrue: [ ^ 100 * noun + verb ]
				ifFalse: [ vm reset ] ] ]