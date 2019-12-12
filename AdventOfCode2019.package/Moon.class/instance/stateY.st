accessing
stateY
	"comment stating purpose of message"

	| tmp |
	tmp := Array new: 2.
	tmp
		at: 1 put: y;
		at: 2 put: dy.
	^ tmp