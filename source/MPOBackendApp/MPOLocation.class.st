Class {
	#name : 'MPOLocation',
	#superclass : 'Object',
	#classVars : [
		'Locations'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Startup' }
MPOLocation class >> createLocations [

	self locations isNil
		ifTrue: [
			self locations: (OrderedCollection new
				add: 'Freiburg';
				add: 'Frankfurt';
				add: 'Berlin';
			yourself)]
]

{ #category : 'Accessing' }
MPOLocation class >> locations [

	"<^hOf Collection of: {iOf String}>"
	"Answer the Locations of the receiver"

	^Locations
]

{ #category : 'Accessing' }
MPOLocation class >> locations: aCollection [

	"<aCollection: hOf Collection of: {iOf String}, ^self>"
	"Set the Locations of the receiver"

	Locations := aCollection
]
