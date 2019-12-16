problems
dayGp1
	"comment stating purpose of message"

	| parsed |
	parsed := input.
	100 timesRepeat: [ parsed := FFT process: parsed ].
	^ parsed copyFrom: 1 to: 8