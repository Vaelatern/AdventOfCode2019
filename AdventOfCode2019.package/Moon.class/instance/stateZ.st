accessing
stateZ
	"comment stating purpose of message"

	| tmp |
	tmp := Array new: 2.
	tmp
		at: 1 put: z;
		at: 2 put: dz.
	^ tmp