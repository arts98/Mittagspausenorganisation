Class {
	#name : 'MPOOpeningTime',
	#superclass : 'Object',
	#instVars : [
		'week'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPOOpeningTime class >> new [


	^super new initialize
]

{ #category : 'logic' }
MPOOpeningTime >> addOpeningTime: aOpeningTime atDay: aDay [

	self week at: aDay put: aOpeningTime
]

{ #category : 'logic' }
MPOOpeningTime >> initialize [

	self week: Dictionary new
]

{ #category : 'Accessing' }
MPOOpeningTime >> week [

	"<^hOf Dictionary: {key: iOf String, value: iOf String}>"
	"Answer the week of the receiver"

	^week
]

{ #category : 'Accessing' }
MPOOpeningTime >> week: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf String, value: iOf String}, ^self>"
	"Set the week of the receiver"

	week := aDictionary
]
