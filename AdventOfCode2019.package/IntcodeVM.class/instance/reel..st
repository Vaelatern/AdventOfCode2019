accessing
reel: anObject

|reelAsArray|
	reelAsArray := (',' split: anObject).
	unusedReel := Dictionary new.
	1 to: reelAsArray size do: [ :i | unusedReel at: i put: (reelAsArray at: i) asInteger  ].
	self reset