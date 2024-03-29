problems
dayCp2
	"dayCp2 with the realization that the loop must proceed through the original state (since state n-1 can be computed knowing only state n)"

	| moons pastX pastY pastZ loop loopX loopY loopZ makeState lcm3 frequencies mergeDicts |
	moons := input lines
		collect: [ :line | 
			| locs |
			locs := (' ' split: line) collect: [ :i | i asInteger ].
			Moon new locX: locs first Y: locs second Z: locs third ].
	frequencies := [ :in | 
	| a |
	a := Dictionary new.
	in asSet
		do: [ :v | 
			a at: v put: (in count: [ :i | i = v ]).
			a ].
	a ].
	mergeDicts := [ :a :b | 
	| rV |
	rV := a copy.
	b
		keysAndValuesDo: [ :key :val | rV at: key put: (val max: (a at: key ifAbsent: [ 0 ])) ].
	rV ].
	lcm3 := [ :a :b :c | 
	| rV |
	rV := mergeDicts
		value:
			(mergeDicts
				value: (frequencies value: a)
				value: (frequencies value: b))
		value: (frequencies value: c).
	(rV keys collect: [ :k | k raisedTo: (rV at: k) ])
		reduce: [ :d :e | d * e ] ].
	makeState := [ :allMoons :getx :gety | 
	allMoons
		collect: [ :m | 
			getx
				ifTrue: [ m stateX ]
				ifFalse: [ gety
						ifTrue: [ m stateY ]
						ifFalse: [ m stateZ ] ] ] ].
	pastX := makeState value: moons value: true value: false.
	pastY := makeState value: moons value: false value: true.
	pastZ := makeState value: moons value: false value: false.
	loopX := loopY := loopZ := nil.
	loop := 1.
	[ loopX notNil and: (loopY notNil and: loopZ notNil) ]
		whileFalse: [ moons do: [ :moon | moon considerMoons: moons ].
			moons do: [ :moon | moon step ].
			loopX isNil
				ifTrue: [ pastX = (makeState value: moons value: true value: false)
						ifTrue: [ loopX := loop ] ].
			loopY isNil
				ifTrue: [ pastY = (makeState value: moons value: false value: true)
						ifTrue: [ loopY := loop ] ].
			loopZ isNil
				ifTrue: [ pastZ = (makeState value: moons value: false value: false)
						ifTrue: [ loopZ := loop ] ].
			loop := loop + 1 ].
	^ lcm3
		value: loopX primeFactors
		value: loopY primeFactors
		value: loopZ primeFactors