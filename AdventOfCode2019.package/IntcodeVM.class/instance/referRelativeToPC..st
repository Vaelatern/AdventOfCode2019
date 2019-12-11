private
referRelativeToPC: index
	"comment stating purpose of message"

	^ self reelAt: (self reelAt: pc + index) + 1