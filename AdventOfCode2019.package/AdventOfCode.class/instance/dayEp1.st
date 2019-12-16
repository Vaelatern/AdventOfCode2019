problems
dayEp1
	"comment stating purpose of message"

	| reactions makeNumPair computedNeeds reactionLevels |
	makeNumPair := [ :strIn :norm | 
	| tmp |
	tmp := ' ' split: strIn.
	Array with: tmp first asInteger / norm with: tmp second ].
	reactions := Dictionary new.
	input lines
		do: [ :line | 
			| tmp needs toget normBy |
			tmp := '=>' split: line.
			toget := tmp second trim.
			needs := (tmp collect: [ :i | ',' split: i ]) first
				collect: [ :i | i trim ].
			normBy := (makeNumPair value: toget value: 1) first.
			reactions
				at: (makeNumPair value: toget value: 1) second
				put: (needs collect: [ :what | makeNumPair value: what value: normBy ]) ].
	reactionLevels := Dictionary new.
	computedNeeds := Dictionary new
		at: 'FUEL' put: 1;
		yourself.
	[ computedNeeds keys size > 1
		or: (computedNeeds keys asSet includes: 'ORE') not ]
		whileTrue: [ | newDict |
			newDict := Dictionary new.
			computedNeeds
				keysAndValuesDo: [ :k :v | 
					(reactions at: k)
						do: [ :pair | 
							| what much |
							much := pair first.
							what := pair second.
							newDict
								at: what
								put: much * v + (newDict at: what ifAbsent: [ 0 ]) ] ].
			computedNeeds := newDict ].
	^ computedNeeds at: 'ORE'