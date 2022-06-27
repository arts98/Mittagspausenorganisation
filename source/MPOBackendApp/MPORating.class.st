Class {
	#name : 'MPORating',
	#superclass : 'Object',
	#instVars : [
		'note',
		'tags',
		'starRating',
		'timestamp',
		'userPerson'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPORating class >> new [

	^super new initialize
]

{ #category : 'logic' }
MPORating >> < aMPORating [

	^self timestamp < aMPORating timestamp 
]

{ #category : 'logic' }
MPORating >> <= aMPORating [

	^self timestamp < aMPORating timestamp 
]

{ #category : 'logic' }
MPORating >> addTag: aTag [

	self tags add: aTag
]

{ #category : 'logic' }
MPORating >> initialize [

	self tags: OrderedCollection new
]

{ #category : 'Accessing' }
MPORating >> note [

	"<^iOf String>"
	"Answer the note of the receiver"

	^note
]

{ #category : 'Accessing' }
MPORating >> note: aString [

	"<aString: iOf String, ^self>"
	"Set the note of the receiver"

	note := aString
]

{ #category : 'Accessing' }
MPORating >> starRating [

	"<^hOf Integer>"
	"Answer the starRating of the receiver"

	^starRating
]

{ #category : 'Accessing' }
MPORating >> starRating: anInteger [

	"<anInteger: hOf Integer, ^self>"
	"Set the starRating of the receiver"

	starRating := anInteger
]

{ #category : 'Accessing' }
MPORating >> tags [

	"<^hOf Collection of: {iOf Tag}>"
	"Answer the tags of the receiver"

	^tags
]

{ #category : 'Accessing' }
MPORating >> tags: aCollection [

	"<aCollection: hOf Collection of: {iOf Tag}, ^self>"
	"Set the tags of the receiver"

	tags := aCollection
]

{ #category : 'Accessing' }
MPORating >> timestamp [

	"<^iOf aclwtimestamp>"
	"Answer the timestamp of the receiver"

	^timestamp
]

{ #category : 'Accessing' }
MPORating >> timestamp: anaclwtimestamp [

	"<anaclwtimestamp: iOf aclwtimestamp, ^self>"
	"Set the timestamp of the receiver"

	timestamp := anaclwtimestamp
]

{ #category : 'Accessing' }
MPORating >> userPerson [

	"<^iOf Person>"
	"Answer the userPerson of the receiver"

	^userPerson
]

{ #category : 'Accessing' }
MPORating >> userPerson: aPerson [

	"<aPerson: iOf Person, ^self>"
	"Set the userPerson of the receiver"

	userPerson := aPerson
]
