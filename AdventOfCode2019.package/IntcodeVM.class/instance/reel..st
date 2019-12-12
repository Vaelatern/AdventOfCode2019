accessing
reel: anObject
	| reelAsArray |
	reelAsArray := ',' split: anObject.
	unusedReel := Dictionary new.
	reelAsArray doWithIndex: [ :v :i | unusedReel at: i put: v asInteger ].
	self reset