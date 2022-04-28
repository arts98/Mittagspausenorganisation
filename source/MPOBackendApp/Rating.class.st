Class {
	#name : 'Rating',
	#superclass : 'Object',
	#instVars : [
		'comment',
		'tags'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
Rating >> addTag: aTag [

	tags add: aTag
]

{ #category : 'Accessing' }
Rating >> comment: aString [

	"<aString: iOf String, ^self>"
	"Set the comment of the receiver"

	comment := aString
]

{ #category : 'Accessing' }
Rating >> comment1 [

	"<^iOf String>"
	"Answer the comment of the receiver"

	^comment
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
