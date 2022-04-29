Class {
	#name : 'Order',
	#superclass : 'Object',
	#instVars : [
		'person',
		'food'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
Order >> addFood: aFood [

	self food add: aFood
]

{ #category : 'Accessing' }
Order >> food [

	"<^hOf Collection of: {iOf Food}>"
	"Answer the food of the receiver"

	^food
]

{ #category : 'Accessing' }
Order >> food: aCollection [

	"<aCollection: hOf Collection of: {iOf Food}, ^self>"
	"Set the food of the receiver"

	food := aCollection
]

{ #category : 'Accessing' }
Order >> person [

	"<^iOf Person>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
Order >> person: aPerson [

	"<aPerson: iOf Person, ^self>"
	"Set the person of the receiver"

	person := aPerson
]
