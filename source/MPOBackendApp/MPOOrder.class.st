Class {
	#name : 'MPOOrder',
	#superclass : 'Object',
	#instVars : [
		'person',
		'food',
		'note'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
MPOOrder >> food [

	"<^iOf MPOFood>"
	"Answer the food of the receiver"

	^food
]

{ #category : 'Accessing' }
MPOOrder >> food: aMPOFood [

	"<aMPOFood: iOf MPOFood, ^self>"
	"Set the food of the receiver"

	food := aMPOFood
]

{ #category : 'Accessing' }
MPOOrder >> note [

	"<^iOf String>"
	"Answer the note of the receiver"

	^note
]

{ #category : 'Accessing' }
MPOOrder >> note: aString [

	"<aString: iOf String, ^self>"
	"Set the note of the receiver"

	note := aString
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

{ #category : 'logic' }
MPOOrder >> priceOfOrder [
	self food isNil
		ifTrue: [^0].
	^self food price

]
