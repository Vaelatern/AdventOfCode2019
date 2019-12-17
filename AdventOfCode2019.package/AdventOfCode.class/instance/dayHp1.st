problems
dayHp1
	"comment stating purpose of message"

	| outscreen rV |
	rV := 0.
	outscreen := (''
		join:
			(((IntcodeVM new reel: input)
				runToHalt;
				stdoutFlush) collect: [ :i | i asCharacter ])) lines.
	Transcript show: outscreen.
	2 to: outscreen size - 2 do: [ :y | 
		2 to: (outscreen at: y) size - 1 do: [ :x | 
			(((outscreen at: y) at: x) = $#
				and:
					(((outscreen at: y + 1) at: x) = $#
						and:
							(((outscreen at: y - 1) at: x) = $#
								and:
									(((outscreen at: y) at: x + 1) = $#
										and: ((outscreen at: y) at: x - 1) = $#))))
				ifTrue: [ rV := (x - 1) * (y - 1) + rV ] ] ].
	^ rV