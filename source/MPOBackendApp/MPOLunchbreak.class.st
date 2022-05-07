Class {
	#name : 'MPOLunchbreak',
	#superclass : 'Object',
	#instVars : [
		'restaurant',
		'voting'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
MPOLunchbreak >> addRestaurant: aRestaurant [

	self restaurant add: aRestaurant
]

{ #category : 'Accessing' }
MPOLunchbreak >> restaurant [

	"<^hOf Collection of: {iOf Restaurant}>"
	"Answer the restaurant of the receiver"

	^restaurant
]

{ #category : 'Accessing' }
MPOLunchbreak >> restaurant: aCollection [

	"<aCollection: hOf Collection of: {iOf Restaurant}, ^self>"
	"Set the restaurant of the receiver"

	restaurant := aCollection
]

{ #category : 'Accessing' }
MPOLunchbreak >> voting [

	"<^iOf Voting>"
	"Answer the voting of the receiver"

	^voting
]

{ #category : 'Accessing' }
MPOLunchbreak >> voting: aVoting [

	"<aVoting: iOf Voting, ^self>"
	"Set the voting of the receiver"

	voting := aVoting
]
