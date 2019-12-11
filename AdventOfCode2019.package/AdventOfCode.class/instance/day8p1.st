problems
day8p1
	"comment stating purpose of message"

	| in layers x y rV |
	layers := OrderedCollection new.
	x := 25.
	y := 6.
	in := input asOrderedCollection collect: [ :i | i asString asInteger ].
	input asOrderedCollection.
	1 to: in size / (x * y) do: [ :_ | layers add: (in removeFirst: x * y) asOrderedCollection ].
	rV := layers
		collect: [ :layer | 
			OrderedCollection
				with: (layer select: [ :i | i = 0 ]) size
				with: (layer select: [ :i | i = 1 ]) size * (layer select: [ :i | i = 2 ]) size ].
	^ (rV
		inject: rV first
		into: [ :a :c | 
			a first > c first
				ifTrue: [ c ]
				ifFalse: [ a ] ]) second