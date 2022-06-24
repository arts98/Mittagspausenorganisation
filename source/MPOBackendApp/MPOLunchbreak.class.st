"
not used
"
Class {
	#name : 'MPOLunchbreak',
	#superclass : 'Object',
	#instVars : [
		'restaurants',
		'voting'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPOLunchbreak class >> new [
	
	^super new initialize
]

{ #category : 'logic' }
MPOLunchbreak >> addRestaurant: aRestaurant [

	self restaurants add: aRestaurant
]

{ #category : 'logic' }
MPOLunchbreak >> initialize [
	
	self restaurants: OrderedCollection new
]

{ #category : 'Accessing' }
MPOLunchbreak >> restaurants [

	"<^hOf Collection of: {iOf MPORestaurant}>"
	"Answer the restaurants of the receiver"

	^restaurants
]

{ #category : 'Accessing' }
MPOLunchbreak >> restaurants: aCollection [

	"<aCollection: hOf Collection of: {iOf MPORestaurant}, ^self>"
	"Set the restaurants of the receiver"

	restaurants := aCollection
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
