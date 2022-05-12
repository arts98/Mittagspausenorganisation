Class {
	#name : 'MPOVoting',
	#superclass : 'Object',
	#instVars : [
		'voting',
		'restaurantsToVote'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'accessing' }
MPOVoting >> addVote: aVote [
	self voting add: aVote
]

{ #category : 'accessing' }
MPOVoting >> getFavorit [
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
				highest := countvote]].
	^top

]

{ #category : 'accessing' }
MPOVoting >> restaurantsToVote [
	^restaurantsToVote
]

{ #category : 'accessing' }
MPOVoting >> restaurantsToVote: anObject [
	restaurantsToVote := anObject
]

{ #category : 'accessing' }
MPOVoting >> voting [
	^voting
]

{ #category : 'accessing' }
MPOVoting >> voting: anObject [
	voting := anObject
]
