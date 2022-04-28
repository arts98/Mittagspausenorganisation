Class {
	#name : 'Tag',
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
Tag >> gutePizza [

	"<^iOf String>"
	"Answer the gutePizza of the receiver"

	^gutePizza
]

{ #category : 'Accessing' }
Tag >> gutePizza: aString [

	"<aString: iOf String, ^self>"
	"Set the gutePizza of the receiver"

	gutePizza := aString
]

{ #category : 'Accessing' }
Tag >> guterPreis [

	"<^iOf String>"
	"Answer the guterPreis of the receiver"

	^guterPreis
]

{ #category : 'Accessing' }
Tag >> guterPreis: aString [

	"<aString: iOf String, ^self>"
	"Set the guterPreis of the receiver"

	guterPreis := aString
]

{ #category : 'Accessing' }
Tag >> guterService [

	"<^iOf String>"
	"Answer the guterService of the receiver"

	^guterService
]

{ #category : 'Accessing' }
Tag >> guterService: aString [

	"<aString: iOf String, ^self>"
	"Set the guterService of the receiver"

	guterService := aString
]

{ #category : 'Accessing' }
Tag >> nettesPersonal [

	"<^iOf String>"
	"Answer the nettesPersonal of the receiver"

	^nettesPersonal
]

{ #category : 'Accessing' }
Tag >> nettesPersonal: aString [

	"<aString: iOf String, ^self>"
	"Set the nettesPersonal of the receiver"

	nettesPersonal := aString
]

{ #category : 'Accessing' }
Tag >> schoeneUmgebung [

	"<^iOf String>"
	"Answer the schoeneUmgebung of the receiver"

	^schoeneUmgebung
]

{ #category : 'Accessing' }
Tag >> schoeneUmgebung: aString [

	"<aString: iOf String, ^self>"
	"Set the schoeneUmgebung of the receiver"

	schoeneUmgebung := aString
]

{ #category : 'Accessing' }
Tag >> vegetarisch [

	"<^iOf String>"
	"Answer the vegetarisch of the receiver"

	^vegetarisch
]

{ #category : 'Accessing' }
Tag >> vegetarisch: aString [

	"<aString: iOf String, ^self>"
	"Set the vegetarisch of the receiver"

	vegetarisch := aString
]
