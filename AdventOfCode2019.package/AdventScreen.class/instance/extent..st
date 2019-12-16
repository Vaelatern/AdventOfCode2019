accessing
extent: aPoint
	"comment stating purpose of message"

	| newForm |
	super extent: aPoint.
	newForm := Form extent: self extent depth: 16.
	newForm fillColor: Color black.
	form ifNotNil: [ form displayOn: newForm ].
	form := newForm