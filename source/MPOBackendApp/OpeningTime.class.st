Class {
	#name : 'OpeningTime',
	#superclass : 'Object',
	#instVars : [
		'week'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
OpeningTime class >> new [
	
	^super new
		week: Dictionary new
		yourself
]

{ #category : 'logic' }
OpeningTime >> addOpeningTime: aOpeningTime atDay: aDay [

	self week at: aDay put: aOpeningTime
]

{ #category : 'Accessing' }
OpeningTime >> week [

	"<^hOf Dictionary: {key: iOf String, value: iOf String}>"
	"Answer the week of the receiver"

	^week
]

{ #category : 'Accessing' }
OpeningTime >> week: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf String, value: iOf String}, ^self>"
	"Set the week of the receiver"

	week := aDictionary
]
