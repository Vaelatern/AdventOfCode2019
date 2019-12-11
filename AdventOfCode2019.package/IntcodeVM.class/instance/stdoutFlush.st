accessing
stdoutFlush
	"comment stating purpose of message"

	| tmp |
	tmp := OrderedCollection new.
	[stdout isEmpty] whileFalse: [ tmp add: stdout next ].
	^ tmp