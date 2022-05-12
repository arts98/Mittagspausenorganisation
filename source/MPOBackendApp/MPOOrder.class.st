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

{ #category : 'OnCreate' }
MPOOrder class >> new [

	^super new
		food: OrderedCollection new
		yourself
]

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

	| sum |
	sum := 0.
	self food do: [ :aFood | 
		sum := (sum + aFood price)].
	^sum
]
