iterating
allChildren
	"comment stating purpose of message"

	^ children size + (children inject: 0 into: [ :sum :child | sum + child allChildren ])