Class {
	#name : 'OpeningTime',
	#superclass : 'Object',
	#instVars : [
		'week'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
OpeningTime >> addDay: aDay key: aKey [

	week at: aKey put: aDay
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
