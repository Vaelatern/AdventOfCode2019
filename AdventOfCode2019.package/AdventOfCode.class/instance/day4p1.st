problems
day4p1
	"comment stating purpose of message"

	| x doubleFound totalFound tmpstr |
	x := 1.
	totalFound := 0.
	('-' split: self input) first asInteger to: ('-' split: self input) second asInteger do: [ :numUnderTest | 
		tmpstr := numUnderTest asString.
		tmpstr isSorted
			ifTrue: [ x := 1.
				doubleFound := false.
				[ doubleFound not and: [ x < tmpstr size ] ]
					whileTrue: [ doubleFound := (tmpstr at: x) = (tmpstr at: x + 1).
						x := x + 1 ].
				doubleFound
					ifTrue: [ totalFound := totalFound + 1 ] ] ].
	^ totalFound