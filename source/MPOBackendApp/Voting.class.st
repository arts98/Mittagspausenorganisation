Class {
	#name : 'Voting',
	#superclass : 'Object',
	#instVars : [
		'voting',
		'restaurantsToVote'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'accessing' }
Voting >> restaurantsToVote [
	^restaurantsToVote
]

{ #category : 'accessing' }
Voting >> restaurantsToVote: anObject [
	restaurantsToVote := anObject
]

{ #category : 'accessing' }
Voting >> voting [
	^voting
]

{ #category : 'accessing' }
Voting >> voting: anObject [
	voting := anObject
]
