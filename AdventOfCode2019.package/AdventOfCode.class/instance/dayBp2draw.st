problems
dayBp2draw
	"comment stating purpose of message"

	| in  screen |
	in := self dayBp2.
	screen := AdventScreen new.
	in keysAndValuesDo: [ :k :v | screen at: k color: v ].
	screen openInWorld