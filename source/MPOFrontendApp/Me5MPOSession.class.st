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

	"<^iOf MPOPerson>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
Me5MPOSession >> person: aMPOPerson [

	"<aMPOPerson: iOf MPOPerson, ^self>"
	"Set the person of the receiver"

	person := aMPOPerson
]
