problems
dayCp2slow
	"comment stating purpose of message"

	| moons pastX pastY pastZ loopX loopY loopZ makeState lcm3 frequencies mergeDicts |
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
	pastX := Set new: 100000.
	pastY := Set new: 100000.
	pastZ := Set new: 100000.
	loopX := loopY := loopZ := nil.
	[ loopX notNil and: (loopY notNil and: loopZ notNil) ]
		whileFalse: [ loopX isNil
				ifTrue: [ pastX add: (makeState value: moons value: true value: false) ].
			loopY isNil
				ifTrue: [ pastY add: (makeState value: moons value: false value: true) ].
			loopZ isNil
				ifTrue: [ pastZ add: (makeState value: moons value: false value: false) ].
			moons do: [ :moon | moon considerMoons: moons ].
			moons do: [ :moon | moon step ].
			loopX isNil
				ifTrue: [ (pastX includes: (makeState value: moons value: true value: false))
						ifTrue: [ loopX := pastX size ] ].
			loopY isNil
				ifTrue: [ (pastY includes: (makeState value: moons value: false value: true))
						ifTrue: [ loopY := pastY size ] ].
			loopZ isNil
				ifTrue: [ (pastZ includes: (makeState value: moons value: false value: false))
						ifTrue: [ loopZ := pastZ size ] ] ].
	^ lcm3
		value: loopX primeFactors
		value: loopY primeFactors
		value: loopZ primeFactors