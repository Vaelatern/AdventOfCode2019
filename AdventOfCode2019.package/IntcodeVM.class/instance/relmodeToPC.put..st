private
relmodeToPC: index put: val
	"comment stating purpose of message"

	^ reel at: (self reelAt:  pc + index) + relbase put: val