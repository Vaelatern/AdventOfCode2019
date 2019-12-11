accessing
relmodeToPC: index put: val
	"comment stating purpose of message"

	^ reel at: (self reelAt: self pc + index) + relbase put: val