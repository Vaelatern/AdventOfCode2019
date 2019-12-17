problems
dayGp1
	"comment stating purpose of message"

	| parsed fft |
	parsed := input.
	fft := [ :in | 
	| inArray asOneDigit basePattern makePattern processed |
	basePattern := #(0 1 0 -1).
	makePattern := [ :length :digNum | 
	| rV |
	rV := OrderedCollection new.
	length // (basePattern size * digNum) + 1
		timesRepeat: [ basePattern do: [ :n | digNum timesRepeat: [ rV add: n ] ] ].
	rV copyFrom: 2 to: length + 1 ].
	asOneDigit := [ :i | i asString last asString asInteger ].
	inArray := in asArray collect: [ :i | i asString asInteger ].
	processed := OrderedCollection new.
	1 to: inArray size do: [ :n | 
		processed
			add:
				(asOneDigit
					value: ((makePattern value: inArray size value: n) * inArray) sum) ].
	^ '' join: (processed collect: [ :i | i asString ]) ].
	100 timesRepeat: [ parsed := fft value: parsed ].
	^ parsed copyFrom: 1 to: 8