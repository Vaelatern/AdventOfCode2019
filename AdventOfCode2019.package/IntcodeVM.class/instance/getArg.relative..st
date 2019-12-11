accessing
getArg: index relative: refType
	"comment stating purpose of message"

	^ refType = 0
		ifTrue: [ ^ self referRelativeToPC: index ]
		ifFalse: [ refType = 1
				ifTrue: [ ^ self relativeToPC: index ]
				ifFalse: [ refType = 2
						ifTrue: [ ^ self relmodeToPC: index ]
						ifFalse: [ ^ nil ] ] ]