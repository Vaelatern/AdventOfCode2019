accessing
considerMoon: moon
	"comment stating purpose of message"

	| diffX diffY diffZ |
	diffX := moon x - x.
	diffY := moon y - y.
	diffZ := moon z - z.
	diffX = 0 ifFalse: [ 
	dx := dx
		+
			(diffX > 0
				ifTrue: [ 1]
				ifFalse: [ -1 ]) ].
	diffY = 0 ifFalse: [ 
	dy := dy
		+
			(diffY > 0
				ifTrue: [ 1]
				ifFalse: [ -1 ]) ].
				diffZ = 0 ifFalse: [ 
	dz := dz
		+
			(diffZ > 0
				ifTrue: [ 1]
				ifFalse: [ -1 ]) ]