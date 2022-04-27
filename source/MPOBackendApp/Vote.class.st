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
Vote >> person: anObject [
	person := anObject
]

{ #category : 'accessing' }
Vote >> restaurant [
	^restaurant
]

{ #category : 'accessing' }
Vote >> restaurant: anObject [
	restaurant := anObject
]

{ #category : 'accessing' }
Vote >> vote [
	^vote
]

{ #category : 'accessing' }
Vote >> vote: anObject [
	vote := anObject
]
