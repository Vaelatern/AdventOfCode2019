problems
dayCp2
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
		 (rV keys collect: [ :k | k raisedTo: (rV at: k) ]) reduce: [ :d :e | d *e ]].
	makeState := [ :allMoons :type | 
	| tmp |
	tmp := Array new: allMoons size.
	allMoons doWithIndex: [ :m :i | tmp at: i put: (m perform: type) ].
	tmp ].
	pastX := Set new.
	pastY := Set new.
	pastZ := Set new.
	loopX := loopY := loopZ := nil.
	[ loopX notNil and: (loopY notNil and: loopZ notNil) ]
		whileFalse: [ pastX add: (makeState value: moons value: #stateX).
			pastY add: (makeState value: moons value: #stateY).
			pastZ add: (makeState value: moons value: #stateZ).
			moons do: [ :moon | moon considerMoons: moons ].
			moons do: [ :moon | moon step ].
			loopX isNil
				ifTrue: [ (pastX includes: (makeState value: moons value: #stateX))
						ifTrue: [ loopX := pastX size ] ].
			loopY isNil
				ifTrue: [ (pastY includes: (makeState value: moons value: #stateY))
						ifTrue: [ loopY := pastY size ] ].
			loopZ isNil
				ifTrue: [ (pastZ includes: (makeState value: moons value: #stateZ))
						ifTrue: [ loopZ := pastZ size ] ] ].
	^ lcm3
		value: loopX primeFactors
		value: loopY primeFactors
		value: loopZ primeFactors