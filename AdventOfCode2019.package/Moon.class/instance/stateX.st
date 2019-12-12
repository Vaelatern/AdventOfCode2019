accessing
stateX
	"comment stating purpose of message"

	| tmp |
	tmp := Array new: 2.
	tmp
		at: 1 put: x;
		at: 2 put: dx.
	^ tmp