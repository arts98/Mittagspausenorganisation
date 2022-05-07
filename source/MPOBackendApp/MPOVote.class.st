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

{ #category : 'accessing' }
MPOVote >> person [
	^person
]

{ #category : 'accessing' }
MPOVote >> person: aPerson [
	person := aPerson
]

{ #category : 'accessing' }
MPOVote >> restaurant [
	^restaurant
]

{ #category : 'accessing' }
MPOVote >> restaurant: aRestaurant [
	restaurant := aRestaurant
]

{ #category : 'accessing' }
MPOVote >> vote [
	^vote
]

{ #category : 'accessing' }
MPOVote >> vote: aBool [
	vote := aBool
]
