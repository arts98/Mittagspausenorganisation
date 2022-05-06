Class {
	#name : 'MPOOrder',
	#superclass : 'Object',
	#instVars : [
		'person',
		'food'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
MPOOrder >> addFood: aFood [

	self food add: aFood
]

{ #category : 'Accessing' }
MPOOrder >> food [

	"<^hOf Collection of: {iOf Food}>"
	"Answer the food of the receiver"

	^food
]

{ #category : 'Accessing' }
MPOOrder >> food: aCollection [

	"<aCollection: hOf Collection of: {iOf Food}, ^self>"
	"Set the food of the receiver"

	food := aCollection
]

{ #category : 'Accessing' }
MPOOrder >> person [

	"<^iOf Person>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
MPOOrder >> person: aPerson [

	"<aPerson: iOf Person, ^self>"
	"Set the person of the receiver"

	person := aPerson
]
