Class {
	#name : 'Me5MPOSession',
	#superclass : 'Bs4Session',
	#instVars : [
		'person'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'API' }
Me5MPOSession >> hasPerson [

	^self person notNil
]

{ #category : 'Accessing' }
Me5MPOSession >> person [

	"<^iOf Object>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
Me5MPOSession >> person: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the person of the receiver"

	person := anObject
]
