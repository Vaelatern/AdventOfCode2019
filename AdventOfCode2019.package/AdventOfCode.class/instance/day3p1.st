problems
day3p1
	"comment stating purpose of message"

	| line1 line2 x y alter setAppend procLine manhattanDistance |
	x := y := 0.
	manhattanDistance := [ :str | (',' split: str) first asInteger abs + (',' split: str) second asInteger abs ].
	setAppend := [ :set | set add: x asString , ',' , y asString ].
	alter := Dictionary new.
	alter
		at: $U
		put: [ :set :many | 
			1 to: many do: [ :a | 
				y := y + 1.
				setAppend value: set ] ].
	alter
		at: $D
		put: [ :set :many | 
			1 to: many do: [ :a | 
				y := y - 1.
				setAppend value: set ] ].
	alter
		at: $L
		put: [ :set :many | 
			1 to: many do: [ :a | 
				x := x - 1.
				setAppend value: set ] ].
	alter
		at: $R
		put: [ :set :many | 
			1 to: many do: [ :a | 
				x := x + 1.
				setAppend value: set ] ].
	line1 := Set new.
	line2 := Set new.
	procLine := [ :set :line | 
	','
		split: line
		do: [ :cmd | 
			(alter at: cmd first)
				value: set
				value:
					(cmd
						byteAt: 1 put: 0;
						asInteger) ] ].
	x := y := 0.
	procLine value: line1 value: input lines first.
	x := y := 0.
	procLine value: line2 value: input lines second.
	^ ((line1 intersection: line2) collect: manhattanDistance) asOrderedCollection sort first