Class {
	#name : 'MPOOpeningTime',
	#superclass : 'Object',
	#instVars : [
		'openingTimesForWeek'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPOOpeningTime class >> new [


	^super new initialize
]

{ #category : 'logic' }
MPOOpeningTime >> addOpeningTime: aOpeningTime atDay: aDay [

	self openingTimesForWeek at: aDay put: aOpeningTime
]

{ #category : 'logic' }
MPOOpeningTime >> initialize [

	self openingTimesForWeek: Dictionary new
]

{ #category : 'Accessing' }
MPOOpeningTime >> openingTimesForWeek [

	"<^hOf Dictionary: {key: iOf String, value: iOf String}>"
	"Answer the openingTimesForWeek of the receiver"

	^openingTimesForWeek
]

{ #category : 'Accessing' }
MPOOpeningTime >> openingTimesForWeek: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf String, value: iOf String}, ^self>"
	"Set the openingTimesForWeek of the receiver"

	openingTimesForWeek := aDictionary
]
