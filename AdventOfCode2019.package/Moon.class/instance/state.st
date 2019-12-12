accessing
state
	"comment stating purpose of message"

	| tmp |
	tmp := (Array new: 6).
	tmp
		at: 1 put: x;
		at: 2 put: y;
		at: 3 put: z;
		at: 4 put: dx;
		at: 5 put: dy;
		at: 6 put: dz.
	^ tmp