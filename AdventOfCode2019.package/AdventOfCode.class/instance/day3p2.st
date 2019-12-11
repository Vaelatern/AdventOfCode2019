problems
day3p2
	"comment stating purpose of message"

	| line1 line2 x y d alter setAppend procLine |
	x := y := d := 0.
	setAppend := [ :set | set at: x asString , ',' , y asString ifAbsentPut: d ].
	alter := Dictionary new.
	alter
		at: $U
		put: [ :set :many | 
			1 to: many do: [ :a | 
				d := d + 1.
				y := y + 1.
				setAppend value: set ] ].
	alter
		at: $D
		put: [ :set :many | 
			1 to: many do: [ :a | 
				d := d + 1.
				y := y - 1.
				setAppend value: set ] ].
	alter
		at: $L
		put: [ :set :many | 
			1 to: many do: [ :a | 
				d := d + 1.
				x := x - 1.
				setAppend value: set ] ].
	alter
		at: $R
		put: [ :set :many | 
			1 to: many do: [ :a | 
				d := d + 1.
				x := x + 1.
				setAppend value: set ] ].
	
	
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
	x := y := d := 0.
	procLine value: (line1 := Dictionary new) value: input lines first.
	x := y := d := 0.
	procLine value: (line2 := Dictionary new) value: input lines second.
	^ ((line1 keys asSet intersection: line2 keys asSet) collect: [ :a | (line1 at: a) + (line2 at: a) ])
		asOrderedCollection sort first