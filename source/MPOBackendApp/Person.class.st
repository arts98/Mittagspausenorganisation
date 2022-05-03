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

	self persons add: (Person new
		firstname: aFirstname;
		lastname: aLastname;
		username: aUsername;
		email: anEmail;
		password: aPassword
		yourself
	)
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
