Class {
	#name : 'MPOLocation',
	#superclass : 'Object',
	#instVars : [
		'freiburg',
		'frankfurt',
		'berlin'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPOLocation class >> getLocations [
	
	^OrderedCollection new
		add: 'Freiburg';
		add: 'Frankfurt';
		add: 'Berlin';
		yourself
]

{ #category : 'Accessing' }
MPOLocation >> berlin [

	"<^iOf String>"
	"Answer the berlin of the receiver"

	^berlin
]

{ #category : 'Accessing' }
MPOLocation >> berlin: aString [

	"<aString: iOf String, ^self>"
	"Set the berlin of the receiver"

	berlin := aString
]

{ #category : 'Accessing' }
MPOLocation >> frankfurt [

	"<^iOf String>"
	"Answer the frankfurt of the receiver"

	^frankfurt
]

{ #category : 'Accessing' }
MPOLocation >> frankfurt: aString [

	"<aString: iOf String, ^self>"
	"Set the frankfurt of the receiver"

	frankfurt := aString
]

{ #category : 'Accessing' }
MPOLocation >> freiburg [

	"<^iOf String>"
	"Answer the freiburg of the receiver"

	^freiburg
]

{ #category : 'Accessing' }
MPOLocation >> freiburg: aString [

	"<aString: iOf String, ^self>"
	"Set the freiburg of the receiver"

	freiburg := aString
]
