Class {
	#name : 'Food',
	#superclass : 'Object',
	#instVars : [
		'name',
		'vegetarian',
		'price',
		'content'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
Food >> content [

	"<^hOf Collection of: {iOf String}>"
	"Answer the content of the receiver"

	^content
]

{ #category : 'Accessing' }
Food >> content: aCollection [

	"<aCollection: hOf Collection of: {iOf String}, ^self>"
	"Set the content of the receiver"

	content := aCollection
]

{ #category : 'Accessing' }
Food >> name [

	"<^iOf String>"
	"Answer the name of the receiver"

	^name
]

{ #category : 'Accessing' }
Food >> name: aString [

	"<aString: iOf String, ^self>"
	"Set the name of the receiver"

	name := aString
]

{ #category : 'Accessing' }
Food >> price [

	"<^iOf String>"
	"Answer the price of the receiver"

	^price
]

{ #category : 'Accessing' }
Food >> price: aString [

	"<aString: iOf String, ^self>"
	"Set the price of the receiver"

	price := aString
]

{ #category : 'Accessing' }
Food >> vegetarian [

	"<^iOf String>"
	"Answer the vegetarian of the receiver"

	^vegetarian
]

{ #category : 'Accessing' }
Food >> vegetarian: aString [

	"<aString: iOf String, ^self>"
	"Set the vegetarian of the receiver"

	vegetarian := aString
]
