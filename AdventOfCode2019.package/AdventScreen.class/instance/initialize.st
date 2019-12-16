initialization
initialize
	"comment stating purpose of message"

	super initialize.
	self extent: 300 @ 300.
	form := Form extent: self extent depth: 16.
	rawPositions := Dictionary new.
	recMultiple := 5