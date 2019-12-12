problems
day3p1
	"comment stating purpose of message"

	| line1 line2 alter setAppend procLine manhattanDistance |
	manhattanDistance := [ :p | p x abs + p y abs ].
	setAppend := [ :set :p | set add: p ].
	alter := Dictionary new.
	alter
		at: $U
		put: [ :set :many :p | 
			1 to: many do: [ :a | setAppend value: set value: p x @ (p y + a) ].
			p x @ (p y + many) ].
	alter
		at: $D
		put: [ :set :many :p | 
			1 to: many do: [ :a | setAppend value: set value: p x @ (p y - a) ].
			p x @ (p y - many) ].
	alter
		at: $L
		put: [ :set :many :p | 
			1 to: many do: [ :a | setAppend value: set value: (p x - a) @ p y ].
			(p x - many) @ p y ].
	alter
		at: $R
		put: [ :set :many :p | 
			1 to: many do: [ :a | setAppend value: set value: (p x + a) @ p y ].
			(p x + many) @ p y ].
	line1 := Set new.
	line2 := Set new.
	procLine := [ :set :line | 
	| p |
	p := 0 @ 0.
	','
		split: line
		do: [ :cmd | 
			p := (alter at: cmd first)
				value: set
				value:
					(cmd
						byteAt: 1 put: 0;
						asInteger)
				value: p ] ].
	procLine value: line1 value: input lines first.
	procLine value: line2 value: input lines second.
	^ ((line1 intersection: line2) collect: manhattanDistance)
		asOrderedCollection sort first