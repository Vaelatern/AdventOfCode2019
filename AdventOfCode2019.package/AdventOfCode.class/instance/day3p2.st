problems
day3p2
	"comment stating purpose of message"

	| line1 line2 alter setAppend procLine |
	setAppend := [ :set :p :d | set at: p ifAbsentPut: d ].
	alter := Dictionary new.
	alter
		at: $U
		put: [ :set :many :p :d | 
			1 to: many do: [ :a | setAppend value: set value: p x @ (p y + a) value: d + a ].
			p x @ (p y + many) ].
	alter
		at: $D
		put: [ :set :many :p :d | 
			1 to: many do: [ :a | setAppend value: set value: p x @ (p y - a) value: d + a ].
			p x @ (p y - many) ].
	alter
		at: $L
		put: [ :set :many :p :d | 
			1 to: many do: [ :a | setAppend value: set value: (p x - a) @ p y value: d + a ].
			(p x - many) @ p y ].
	alter
		at: $R
		put: [ :set :many :p :d | 
			1 to: many do: [ :a | setAppend value: set value: (p x + a) @ p y value: d + a ].
			(p x + many) @ p y ].
	line1 := (Dictionary new) growTo: input size.
	line2 := (Dictionary new) growTo: input size.
	procLine := [ :set :line | 
	| p d |
	p := 0 @ 0.
	d := 0.
	','
		split: line
		do: [ :cmd | 
			| spanLen |
			p := (alter at: cmd first)
				value: set
				value:
					(spanLen := cmd
						byteAt: 1 put: 0;
						asInteger)
				value: p
				value: d.
			d := d + spanLen ] ].
	procLine value: line1 value: input lines first.
	procLine value: line2 value: input lines second.
	^ ((line1 keys asSet intersection: line2 keys asSet)
		collect: [ :a | (line1 at: a) + (line2 at: a) ]) asOrderedCollection
		sort first