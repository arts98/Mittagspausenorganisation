Class {
	#name : 'Lunchbreak',
	#superclass : 'Object',
	#instVars : [
		'restaurant',
		'voting'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
Lunchbreak >> addRestaurant: aRestaurant [

	restaurant add: aRestaurant
]

{ #category : 'Accessing' }
Lunchbreak >> restaurant [

	"<^hOf Collection of: {iOf Restaurant}>"
	"Answer the restaurant of the receiver"

	^restaurant
]

{ #category : 'Accessing' }
Lunchbreak >> restaurant: aCollection [

	"<aCollection: hOf Collection of: {iOf Restaurant}, ^self>"
	"Set the restaurant of the receiver"

	restaurant := aCollection
]

{ #category : 'Accessing' }
Lunchbreak >> voting [

	"<^iOf Voting>"
	"Answer the voting of the receiver"

	^voting
]

{ #category : 'Accessing' }
Lunchbreak >> voting: aVoting [

	"<aVoting: iOf Voting, ^self>"
	"Set the voting of the receiver"

	voting := aVoting
]
