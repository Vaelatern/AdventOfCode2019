accessing
normalizePositions
	"comment stating purpose of message"

	| minX minY |
	minX := (rawPositions  keys collect: [ :i | i x ]) min.
	minY := (rawPositions  keys collect: [ :i | i y ]) min.
	positions := Dictionary new.
	rawPositions keysAndValuesDo: [ :k :v | positions at: minX @ minY + k put: v ]