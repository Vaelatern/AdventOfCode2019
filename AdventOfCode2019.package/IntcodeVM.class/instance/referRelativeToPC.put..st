private
referRelativeToPC: index put: val
	"comment stating purpose of message"

	^ reel at: (self reelAt:  pc + index) + 1 put: val