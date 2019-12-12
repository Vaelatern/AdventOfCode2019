accessing
considerMoon: moon
	"comment stating purpose of message"

	| diffX diffY diffZ |
	diffX := moon x - x.
	diffY := moon y - y.
	diffZ := moon z - z.
	dx := dx + ((diffX = 0)
		ifTrue: [ 0 ]
		ifFalse: [ diffX > 0
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ]).
	dy := dy + ((diffY = 0)
		ifTrue: [ 0 ]
		ifFalse: [ diffY > 0
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ]).
	dz := dz + ((diffZ = 0)
		ifTrue: [ 0 ]
		ifFalse: [ diffZ > 0
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ])