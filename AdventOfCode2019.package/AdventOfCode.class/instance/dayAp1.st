problems
dayAp1
	"comment stating purpose of message"

	| allPoints maxX maxY rV refPointBetween |
	refPointBetween := [ :a :b | 
	| x y gcd |
	x := a x - b x.
	y := a y - b y.
	gcd := x gcd: y.
	(x / gcd) @ (y / gcd) ].
	allPoints := OrderedCollection new.
	maxY := input lines size.
	maxX := input lines first size.
	1 to: maxY do: [ :y | 
		1 to: maxX do: [ :x | 
			((input lines at: y) at: x) = $#
				ifTrue: [ allPoints add: (x - 0) @ (y - 0) ] ] ].
	rV := allPoints
		collect:
			[ :curPoint | (allPoints select: [ :i | i ~= curPoint ]) collect: [ :i | refPointBetween value: curPoint value: i ] ].
	^ (rV collect: [ :i | i asSet size ]) max