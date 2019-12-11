private
getArg: index relative: refType put: val
	"comment stating purpose of message"

	^ refType = 0
		ifTrue: [ ^ self referRelativeToPC: index put: val ]
		ifFalse: [ refType = 1
				ifTrue: [ ^ self relativeToPC: index put: val]
				ifFalse: [ refType = 2
						ifTrue: [ ^ self relmodeToPC: index put: val]
						ifFalse: [ ^ nil ] ] ]