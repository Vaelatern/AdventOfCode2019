problems
dayCp1
	"comment stating purpose of message"

	| moons |
	moons := input lines
		collect: [ :line | 
			| locs |
			locs := (' ' split: line) collect: [ :i | i asInteger ].
			Moon new locX: locs first Y: locs second Z: locs third ].
	1000
		timesRepeat: [ moons do: [ :moon | moon considerMoons: moons ].
			moons do: [ :moon | moon step ] ].
	^ moons inject: 0 into: [ :sum :moon | sum + moon totalEnergy ]