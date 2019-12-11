accessing
referRelativeToPC: index put: val
	"comment stating purpose of message"

	^ reel at: (self reelAt: self pc + index) + 1 put: val