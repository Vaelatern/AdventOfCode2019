accessing
relmodeToPC: index
	"comment stating purpose of message"

	^ self reelAt: (self reelAt: self pc + index) + relbase