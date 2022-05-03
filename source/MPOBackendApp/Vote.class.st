Class {
	#name : 'Vote',
	#superclass : 'Object',
	#instVars : [
		'person',
		'restaurant',
		'vote'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'accessing' }
Vote >> person [
	^person
]

{ #category : 'accessing' }
Vote >> person: aPerson [
	person := aPerson
]

{ #category : 'accessing' }
Vote >> restaurant [
	^restaurant
]

{ #category : 'accessing' }
Vote >> restaurant: aRestaurant [
	restaurant := aRestaurant
]

{ #category : 'accessing' }
Vote >> vote [
	^vote
]

{ #category : 'accessing' }
Vote >> vote: aBool [
	vote := aBool
]
