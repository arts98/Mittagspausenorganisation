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
Voting >> addVote: aVote [
	self voting add: aVote
]

{ #category : 'accessing' }
Voting >> getFavorit [
	|highest countvote top|
	highest := 0.	
	
	self restaurantsToVote do: [:rest | 
		countvote := 0.
		self voting do: [:votee | 
			(votee vote and: [votee restaurant = rest]) 
				ifTrue: [countvote := (countvote + 1)]].
		(highest < countvote) 
			ifTrue: [
				top := rest.
				highest := countvote]
	].
	^top

]

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
