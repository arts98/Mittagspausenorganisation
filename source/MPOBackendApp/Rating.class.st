Class {
	#name : 'Rating',
	#superclass : 'Object',
	#instVars : [
		'note',
		'tags',
		'starRating'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
Rating >> addTag: aTag [

	self tags add: aTag
]

{ #category : 'Accessing' }
Rating >> note [

	"<^iOf String>"
	"Answer the note of the receiver"

	^note
]

{ #category : 'Accessing' }
Rating >> note: aString [

	"<aString: iOf String, ^self>"
	"Set the note of the receiver"

	note := aString
]

{ #category : 'Accessing' }
Rating >> starRating [

	"<^hOf Integer>"
	"Answer the starRating of the receiver"

	^starRating
]

{ #category : 'Accessing' }
Rating >> starRating: anInteger [

	"<anInteger: hOf Integer, ^self>"
	"Set the starRating of the receiver"

	starRating := anInteger
]

{ #category : 'Accessing' }
Rating >> tags [

	"<^hOf Collection of: {iOf Tag}>"
	"Answer the tags of the receiver"

	^tags
]

{ #category : 'Accessing' }
Rating >> tags: aCollection [

	"<aCollection: hOf Collection of: {iOf Tag}, ^self>"
	"Set the tags of the receiver"

	tags := aCollection
]
