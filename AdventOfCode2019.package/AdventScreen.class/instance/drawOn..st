drawing
drawOn: aCanvas
	| maxY |
	aCanvas drawImage: form at: bounds origin.
	form fillFromXColorBlock: [ :x | Color black ].
	maxY := 0.
	positions keysDo: [ :k | maxY := k y max: maxY ].
	positions
		keysAndValuesDo: [ :k :v | 
			| modK |
			modK := k x @ (maxY + 1 - k y).
			form
				fill: (Rectangle new setPoint: modK * recMultiple point: modK * recMultiple + (recMultiple - 1))
				fillColor: v ]