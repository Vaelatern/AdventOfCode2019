problems
dayAp2
	"comment stating purpose of message"

	| allPoints maxX maxY roidList refPointBetween stationLocation maxRoids normalizedBearing bearingToRoid rV |
	roidList := Dictionary new.
	refPointBetween := [ :a :b | 
	| x y gcd |
	x := b x - a x.
	y := b y - a y.
	gcd := x gcd: y.
	(x / gcd) @ (y / gcd) ].
	allPoints := OrderedCollection new.
	maxY := input lines size.
	maxX := input lines first size.
	1 to: maxY do: [ :y | 
		1 to: maxX do: [ :x | 
			((input lines at: y) at: x) = $#
				ifTrue: [ allPoints add: (x - 1) @ (y - 1) ] ] ].
	allPoints
		do: [ :curPoint | 
			roidList
				at: curPoint
				put:
					((allPoints select: [ :i | i ~= curPoint ]) collect: [ :i | refPointBetween value: curPoint value: i ])
						asSet asOrderedCollection ].
	maxRoids := ((allPoints
		collect:
			[ :curPoint | (allPoints select: [ :i | i ~= curPoint ]) collect: [ :i | refPointBetween value: curPoint value: i ] ])
		collect: [ :i | i asSet size ]) max.
	stationLocation := OrderedCollection new.
	roidList
		keysAndValuesDo: [ :k :v | 
			v size = maxRoids
				ifTrue: [ stationLocation add: k ] ].
	normalizedBearing := [ :a | 0 @ 0 angleWith: (a x @ a y) rightRotated ].
	bearingToRoid := [ :bearing | 
	| multiple |
	multiple := 1.
	[ roidList includesKey: stationLocation first + (bearing * multiple) ]
		whileFalse: [ multiple := multiple + 1 ].
	stationLocation first + (bearing * multiple) ].

	rV := (((roidList at: stationLocation first)
		sorted: [ :a :b | (normalizedBearing value: a) < (normalizedBearing value: b) ]) collect: bearingToRoid)
		at: 200.
		^rV x * 100 + rV y