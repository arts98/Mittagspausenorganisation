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
	countvote := 0.
	
	self restaurantsToVote do: [:rest | 
		(highest < countvote) ifTrue: [top := rest] |
		self voting do: [:votee | 
			(votee vote == true & votee restaurant == rest) 
				ifTrue: [countvote := (countvote + 1)]  ]
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
