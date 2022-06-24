Class {
	#name : 'MPOTag',
	#superclass : 'Object',
	#instVars : [
		'guterPreis',
		'gutePizza',
		'vegetarisch',
		'guterService',
		'nettesPersonal',
		'schoeneUmgebung'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
MPOTag >> gutePizza [

	"<^iOf String>"
	"Answer the gutePizza of the receiver"

	^gutePizza
]

{ #category : 'Accessing' }
MPOTag >> gutePizza: aString [

	"<aString: iOf String, ^self>"
	"Set the gutePizza of the receiver"

	gutePizza := aString
]

{ #category : 'Accessing' }
MPOTag >> guterPreis [

	"<^iOf String>"
	"Answer the guterPreis of the receiver"

	^guterPreis
]

{ #category : 'Accessing' }
MPOTag >> guterPreis: aString [

	"<aString: iOf String, ^self>"
	"Set the guterPreis of the receiver"

	guterPreis := aString
]

{ #category : 'Accessing' }
MPOTag >> guterService [

	"<^iOf String>"
	"Answer the guterService of the receiver"

	^guterService
]

{ #category : 'Accessing' }
MPOTag >> guterService: aString [

	"<aString: iOf String, ^self>"
	"Set the guterService of the receiver"

	guterService := aString
]

{ #category : 'Accessing' }
MPOTag >> nettesPersonal [

	"<^iOf String>"
	"Answer the nettesPersonal of the receiver"

	^nettesPersonal
]

{ #category : 'Accessing' }
MPOTag >> nettesPersonal: aString [

	"<aString: iOf String, ^self>"
	"Set the nettesPersonal of the receiver"

	nettesPersonal := aString
]

{ #category : 'Accessing' }
MPOTag >> schoeneUmgebung [

	"<^iOf String>"
	"Answer the schoeneUmgebung of the receiver"

	^schoeneUmgebung
]

{ #category : 'Accessing' }
MPOTag >> schoeneUmgebung: aString [

	"<aString: iOf String, ^self>"
	"Set the schoeneUmgebung of the receiver"

	schoeneUmgebung := aString
]

{ #category : 'Accessing' }
MPOTag >> vegetarisch [

	"<^iOf String>"
	"Answer the vegetarisch of the receiver"

	^vegetarisch
]

{ #category : 'Accessing' }
MPOTag >> vegetarisch: aString [

	"<aString: iOf String, ^self>"
	"Set the vegetarisch of the receiver"

	vegetarisch := aString
]
