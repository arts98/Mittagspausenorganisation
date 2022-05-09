Class {
	#name : 'MPOPerson',
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
MPOPerson class >> deletePersons [

	self persons: nil
]

{ #category : 'logic' }
MPOPerson class >> fillPersons [

	self persons isEmptyOrNil
		ifTrue: [
			self
				registerPerson: (MPOPerson new firstname: 'Katrin'; lastname: 'Arts'; username: 'kat'; email: 'katrin.arts@hs-furtwangen.de'; password: (ClwCryptoFunctions hashSha256: '123'); yourself);
				registerPerson: (MPOPerson new firstname: 'Max'; lastname: 'Brombach'; username: 'max'; email: 'max.brombach@hs-furtwangen.de'; password: (ClwCryptoFunctions hashSha256: '123'); yourself);
				registerPerson: (MPOPerson new firstname: 'Leonard'; lastname: 'Lemke'; username: 'leo'; email: 'leonard.lemke@hs-furtwangen.de'; password: (ClwCryptoFunctions hashSha256: '123'); yourself);
				registerPerson: (MPOPerson new firstname: 'Silas'; lastname: 'Schulz'; username: 'sil'; email: 'silas.schulz@hs-furtwangen.de'; password: (ClwCryptoFunctions hashSha256: '123'); yourself);
				registerPerson: (MPOPerson new firstname: 'Siyar'; lastname: 'Kartal'; username: 'siy'; email: 'siyar.kartal@hs-furtwangen.de'; password: (ClwCryptoFunctions hashSha256: '123'); yourself);
				yourself]
]

{ #category : 'logic',
  #vaVisibility : 'private' }
MPOPerson class >> hashPassword: aString [

	^ClwCryptoFunctions hashSha256: aString
]

{ #category : 'logic' }
MPOPerson class >> hasPerson [

	^self persons isEmptyOrNil not
]

{ #category : 'logic' }
MPOPerson class >> hasPersonForEmail: anEmail [

	^(self personForEmail: anEmail) notNil
]

{ #category : 'logic' }
MPOPerson class >> logInEmail: anEmail password: aPassword [

	| thePerson |
	thePerson := self personForEmail: anEmail.
	^(thePerson notNil and: [thePerson password = (self hashPassword: aPassword)])
		ifTrue: [thePerson]
]

{ #category : 'logic' }
MPOPerson class >> personForEmail: anEmail [

	^self persons at: anEmail ifAbsent: []
]

{ #category : 'Accessing' }
MPOPerson class >> persons [

	"<^hOf Dictionary: {key: iOf String, value: iOf MPOPerson}>"
	"Answer the Persons of the receiver"

	^Persons
]

{ #category : 'Accessing' }
MPOPerson class >> persons: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf String, value: iOf MPOPerson}, ^self>"
	"Set the Persons of the receiver"

	Persons := aDictionary
]

{ #category : 'logic' }
MPOPerson class >> registerPerson: aPerson [

	self persons isNil
		ifTrue: [self persons: Dictionary new].
	self persons at: aPerson email put: aPerson
]

{ #category : 'Accessing' }
MPOPerson >> email [

	"<^iOf String>"
	"Answer the email of the receiver"

	^email
]

{ #category : 'Accessing' }
MPOPerson >> email: aString [

	"<aString: iOf String, ^self>"
	"Set the email of the receiver"

	email := aString
]

{ #category : 'Accessing' }
MPOPerson >> firstname [

	"<^iOf String>"
	"Answer the firstname of the receiver"

	^firstname
]

{ #category : 'Accessing' }
MPOPerson >> firstname: aString [

	"<aString: iOf String, ^self>"
	"Set the firstname of the receiver"

	firstname := aString
]

{ #category : 'Accessing' }
MPOPerson >> lastname [

	"<^iOf String>"
	"Answer the lastname of the receiver"

	^lastname
]

{ #category : 'Accessing' }
MPOPerson >> lastname: aString [

	"<aString: iOf String, ^self>"
	"Set the lastname of the receiver"

	lastname := aString
]

{ #category : 'Accessing' }
MPOPerson >> password [

	"<^iOf String>"
	"Answer the password of the receiver"

	^password
]

{ #category : 'Accessing' }
MPOPerson >> password: aString [

	"<aString: iOf String, ^self>"
	"Set the password of the receiver"

	password := aString
]

{ #category : 'Accessing' }
MPOPerson >> username [

	"<^iOf String>"
	"Answer the username of the receiver"

	^username
]

{ #category : 'Accessing' }
MPOPerson >> username: aString [

	"<aString: iOf String, ^self>"
	"Set the username of the receiver"

	username := aString
]
