Class {
	#name : 'Location',
	#superclass : 'Object',
	#instVars : [
		'freiburg',
		'frankfurt',
		'berlin'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
Location class >> getLocations [
	
	^OrderedCollection new
		add: 'Freiburg';
		add: 'Frankfurt';
		add: 'Berlin';
		yourself
]

{ #category : 'Accessing' }
Location >> berlin [

	"<^iOf String>"
	"Answer the berlin of the receiver"

	^berlin
]

{ #category : 'Accessing' }
Location >> berlin: aString [

	"<aString: iOf String, ^self>"
	"Set the berlin of the receiver"

	berlin := aString
]

{ #category : 'Accessing' }
Location >> frankfurt [

	"<^iOf String>"
	"Answer the frankfurt of the receiver"

	^frankfurt
]

{ #category : 'Accessing' }
Location >> frankfurt: aString [

	"<aString: iOf String, ^self>"
	"Set the frankfurt of the receiver"

	frankfurt := aString
]

{ #category : 'Accessing' }
Location >> freiburg [

	"<^iOf String>"
	"Answer the freiburg of the receiver"

	^freiburg
]

{ #category : 'Accessing' }
Location >> freiburg: aString [

	"<aString: iOf String, ^self>"
	"Set the freiburg of the receiver"

	freiburg := aString
]
