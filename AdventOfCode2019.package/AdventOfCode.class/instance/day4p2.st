problems
day4p2
	"comment stating purpose of message"

	| x doubleFound totalFound tmpstr |
	x := 1.
	totalFound := 0.
	('-' split: self input) first asInteger to: ('-' split: self input) second asInteger do: [ :numUnderTest | 
		tmpstr := numUnderTest asString.
		tmpstr isSorted
			ifTrue: [ x := 1.
				doubleFound := false.
				[ doubleFound not and: [ x + 1 <= tmpstr size ] ]
					whileTrue: [ doubleFound := (tmpstr at: x) = (tmpstr at: x + 1)
							and: [ x + 1 < tmpstr size
									ifTrue: [ ((tmpstr at: x + 1) ~= (tmpstr at: x + 2)) ]
									ifFalse: [ true ] ].
						[ x < tmpstr size and: [ (tmpstr at: x) = (tmpstr at: x + 1) ] ] whileTrue: [ x := x + 1 ].
						x := x + 1 ].
				doubleFound
					ifTrue: [ totalFound := totalFound + 1 ] ] ].
	^ totalFound