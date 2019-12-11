problems
day8p2
	"comment stating purpose of message"

	| in layers x y transparency |
	transparency := [ :layerTop :layerBottom | 
	(1 to: layerBottom size)
		inject: OrderedCollection new
		into: [ :a :b | 
			a
				add:
					((layerTop at: b) = 2
						ifTrue: [ layerBottom at: b ]
						ifFalse: [ layerTop at: b ]);
				yourself ] ].
	layers := OrderedCollection new.
	x := 25.
	y := 6.
	in := input asOrderedCollection collect: [ :i | i asString asInteger ].
	input asOrderedCollection.
	1 to: in size / (x * y) do: [ :_ | layers add: (in removeFirst: x * y) asOrderedCollection ].
	^ (layers inject: layers first into: [ :a :b | transparency value: a value: b ]) asArray 