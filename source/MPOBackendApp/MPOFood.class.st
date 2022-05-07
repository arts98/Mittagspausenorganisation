Class {
	#name : 'MPOFood',
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
MPOFood >> content [

	"<^hOf Collection of: {iOf String}>"
	"Answer the content of the receiver"

	^content
]

{ #category : 'Accessing' }
MPOFood >> content: aCollection [

	"<aCollection: hOf Collection of: {iOf String}, ^self>"
	"Set the content of the receiver"

	content := aCollection
]

{ #category : 'Accessing' }
MPOFood >> name [

	"<^iOf String>"
	"Answer the name of the receiver"

	^name
]

{ #category : 'Accessing' }
MPOFood >> name: aString [

	"<aString: iOf String, ^self>"
	"Set the name of the receiver"

	name := aString
]

{ #category : 'Accessing' }
MPOFood >> price [

	"<^iOf String>"
	"Answer the price of the receiver"

	^price
]

{ #category : 'Accessing' }
MPOFood >> price: aString [

	"<aString: iOf String, ^self>"
	"Set the price of the receiver"

	price := aString
]

{ #category : 'Accessing' }
MPOFood >> vegetarian [

	"<^(true | false)>"
	"Answer the vegetarian of the receiver"

	^vegetarian
]

{ #category : 'Accessing' }
MPOFood >> vegetarian: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the vegetarian of the receiver"

	vegetarian := aBoolean
]
