Class {
	#name : 'MPOVoting',
	#superclass : 'Object',
	#instVars : [
		'voting',
		'restaurantsToVote'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
MPOVoting >> addVote: aMPOVote [

	self voting add: aMPOVote
]

{ #category : 'logic' }
MPOVoting >> getHighest [

	| theHighestVote theCurrentVote theHighest |
	theHighestVote := 0.	
	
	self restaurantsToVote do: [:eachRestaurant | 
		theCurrentVote := 0.
		self voting do: [:eachVote | 
			(eachVote vote and: [eachVote restaurant = eachRestaurant]) 
				ifTrue: [theCurrentVote := (theCurrentVote + 1)]].
		(theHighestVote < theCurrentVote) 
			ifTrue: [
				theHighest := eachRestaurant.
				theHighestVote := theCurrentVote]].
	^theHighest

]

{ #category : 'Accessing' }
MPOVoting >> restaurantsToVote [

	"<^hOf Collection of: {iOf MPORestaurant}>"
	"Answer the restaurantsToVote of the receiver"

	^restaurantsToVote
]

{ #category : 'Accessing' }
MPOVoting >> restaurantsToVote: aCollection [

	"<aCollection: hOf Collection of: {iOf MPORestaurant}, ^self>"
	"Set the restaurantsToVote of the receiver"

	restaurantsToVote := aCollection
]

{ #category : 'Accessing' }
MPOVoting >> voting [

	"<^hOf Collection of: {iOf MPOVote}>"
	"Answer the voting of the receiver"

	^voting
]

{ #category : 'Accessing' }
MPOVoting >> voting: aCollection [

	"<aCollection: hOf Collection of: {iOf MPOVote}, ^self>"
	"Set the voting of the receiver"

	voting := aCollection
]
