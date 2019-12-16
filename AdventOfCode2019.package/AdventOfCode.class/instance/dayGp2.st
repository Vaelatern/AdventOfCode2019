problems
dayGp2
	"comment stating purpose of message"

	| trueInput parsed toSkip |
	trueInput := WriteStream with: ''.
	10000 timesRepeat: [ trueInput nextPutAll: input ].
	parsed := trueInput contents.
	100 timesRepeat: [ parsed := FFT process: parsed ].
	toSkip := (input copyFrom: 1 to: 7) asInteger.
	[ toSkip > parsed size ]
		whileTrue: [ toSkip := toSkip - parsed size ].
	toSkip > (parsed size - 8)
		ifTrue: [ parsed := parsed , parsed ].
	^ parsed	"copyFrom: toSkip + 1 to: toSkip + 9"