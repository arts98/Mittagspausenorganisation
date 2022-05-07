Class {
	#name : 'Person',
	#superclass : 'Object',
	#instVars : [
		'firstname',
		'lastname',
		'username',
		'email',
		'password'
	],
	#classVars : [
		'Persons'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
Person class >> createPersonFirstname: aFirstname lastname: aLastname username: aUsername email: anEmail password: aPassword [

	self persons isNil
		ifTrue: [self persons: OrderedCollection new].
		
	self persons add: (Person new
		firstname: aFirstname;
		lastname: aLastname;
		username: aUsername;
		email: anEmail;
		password: aPassword
		yourself
	)
]

{ #category : 'logic' }
Person class >> createPersonsCollection [

	self persons isEmptyOrNil
		ifTrue: [
			self 
				createPersonFirstname: 'Katrin' lastname: 'Arts' username: 'kat' email: 'katrin.arts@hs-furtwangen.de' password: '123';
				createPersonFirstname: 'Max' lastname: 'Brombach' username: 'max' email: 'max.brombach@hs-furtwangen.de' password: '123';
				createPersonFirstname: 'Leonard' lastname: 'Lemke' username: 'leo' email: 'leonard.lemke@hs-furtwangen.de' password: '123';
				createPersonFirstname: 'Silas' lastname: 'Schulz' username: 'sil' email: 'silas.schulz@hs-furtwangen.de' password: '123';
				createPersonFirstname: 'Siyar' lastname: 'Kartal' username: 'siy' email: 'siyar.kartal@hs-furtwangen.de' password: '123';
				yourself]
]

{ #category : 'Accessing' }
Person class >> persons [

	"<^hOf Collection of: {iOf Person}>"
	"Answer the Persons of the receiver"

	^Persons
]

{ #category : 'Accessing' }
Person class >> persons: aCollection [

	"<aCollection: hOf Collection of: {iOf Person}, ^self>"
	"Set the Persons of the receiver"

	Persons := aCollection
]

{ #category : 'Accessing' }
Person >> email [

	"<^iOf String>"
	"Answer the email of the receiver"

	^email
]

{ #category : 'Accessing' }
Person >> email: aString [

	"<aString: iOf String, ^self>"
	"Set the email of the receiver"

	email := aString
]

{ #category : 'Accessing' }
Person >> firstname [

	"<^iOf String>"
	"Answer the firstname of the receiver"

	^firstname
]

{ #category : 'Accessing' }
Person >> firstname: aString [

	"<aString: iOf String, ^self>"
	"Set the firstname of the receiver"

	firstname := aString
]

{ #category : 'Accessing' }
Person >> lastname [

	"<^iOf String>"
	"Answer the lastname of the receiver"

	^lastname
]

{ #category : 'Accessing' }
Person >> lastname: aString [

	"<aString: iOf String, ^self>"
	"Set the lastname of the receiver"

	lastname := aString
]

{ #category : 'Accessing' }
Person >> password [

	"<^iOf String>"
	"Answer the password of the receiver"

	^password
]

{ #category : 'Accessing' }
Person >> password: aString [

	"<aString: iOf String, ^self>"
	"Set the password of the receiver"

	password := aString
]

{ #category : 'Accessing' }
Person >> username [

	"<^iOf String>"
	"Answer the username of the receiver"

	^username
]

{ #category : 'Accessing' }
Person >> username: aString [

	"<aString: iOf String, ^self>"
	"Set the username of the receiver"

	username := aString
]
