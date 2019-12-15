event handling
handleKeystroke: ev
	| kv |
	kv := ev keyValue.
	(kv = 30 and: onUp notNil)
		ifTrue: [ onUp value ].	
	(kv = 31 and: onDown notNil)
		ifTrue: [ onDown value ].	
	(kv = 29 and: onRight notNil)
		ifTrue: [ onRight value ].
	(kv = 28 and: onLeft notNil)
		ifTrue: [ onLeft value ]