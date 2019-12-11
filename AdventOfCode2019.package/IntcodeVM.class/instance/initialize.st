instance creation
initialize
	"comment stating purpose of message"

	self createOpcodes.
	stdin := AtomicSharedQueue new.
	stdout := AtomicSharedQueue new.
	pc := 1.
	relbase := 1.