Class {
	#name : 'MPOVote',
	#superclass : 'Object',
	#instVars : [
		'person',
		'restaurant',
		'vote'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
MPOVote >> person [

	"<^iOf MPOPerson>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
MPOVote >> person: aMPOPerson [

	"<aMPOPerson: iOf MPOPerson, ^self>"
	"Set the person of the receiver"

	person := aMPOPerson
]

{ #category : 'Accessing' }
MPOVote >> restaurant [

	"<^iOf MPORestaurant>"
	"Answer the restaurant of the receiver"

	^restaurant
]

{ #category : 'Accessing' }
MPOVote >> restaurant: aMPORestaurant [

	"<aMPORestaurant: iOf MPORestaurant, ^self>"
	"Set the restaurant of the receiver"

	restaurant := aMPORestaurant
]

{ #category : 'Accessing' }
MPOVote >> vote [

	"<^(true | false)>"
	"Answer the vote of the receiver"

	^vote
]

{ #category : 'Accessing' }
MPOVote >> vote: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the vote of the receiver"

	vote := aBoolean
]
