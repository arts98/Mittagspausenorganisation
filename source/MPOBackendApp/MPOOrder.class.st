Class {
	#name : 'MPOOrder',
	#superclass : 'Object',
	#instVars : [
		'person',
		'food',
		'note',
		'price',
		'date'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
MPOOrder >> date [

	"<^iOf Date>"
	"Answer the date of the receiver"

	^date
]

{ #category : 'Accessing' }
MPOOrder >> date: aDate [

	"<aDate: iOf Date, ^self>"
	"Set the date of the receiver"

	date := aDate
]

{ #category : 'Accessing' }
MPOOrder >> food [

	"<^iOf String>"
	"Answer the food of the receiver"

	^food
]

{ #category : 'Accessing' }
MPOOrder >> food: aString [

	"<aString: iOf String, ^self>"
	"Set the food of the receiver"

	food := aString
]

{ #category : 'Accessing' }
MPOOrder >> initialize [
	"The following source failed to compile (all double quotes have been doubled):"
"

	super initialize.
	self date: ClwRkGlobals applicationToday date"
#tonelCompilationFailure.

^ self halt: 'The source for this method failed to compile' 
]

{ #category : 'Accessing' }
MPOOrder >> note [

	"<^iOf String>"
	"Answer the note of the receiver"

	^note
]

{ #category : 'Accessing' }
MPOOrder >> note: aString [

	"<aString: iOf String, ^self>"
	"Set the note of the receiver"

	note := aString
]

{ #category : 'Accessing' }
MPOOrder >> person [

	"<^iOf Person>"
	"Answer the person of the receiver"

	^person
]

{ #category : 'Accessing' }
MPOOrder >> person: aPerson [

	"<aPerson: iOf Person, ^self>"
	"Set the person of the receiver"

	person := aPerson
]

{ #category : 'Accessing' }
MPOOrder >> price [

	"<^hOf Number>"
	"Answer the price of the receiver"

	^price
]

{ #category : 'Accessing' }
MPOOrder >> price: aNumber [

	"<aNumber: hOf Number, ^self>"
	"Set the price of the receiver"

	price := aNumber
]

{ #category : 'Accessing' }
MPOOrder >> printSummary [

	^'%1 %2: %3 fuer %4 Euro - Extras: %5 '
		bindWith: self person firstname
		with: self person lastname
		with: self food
		with: self price
		with: self note
]
