Class {
	#name : 'RestaurantType',
	#superclass : 'Object',
	#instVars : [
		'doener',
		'pizzeria',
		'asiatisch',
		'metzger',
		'baecker',
		'mcdonalds',
		'burgerking',
		'subway',
		'supermarkt'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Accessing' }
RestaurantType >> asiatisch [

	"<^iOf String>"
	"Answer the asiatisch of the receiver"

	^asiatisch
]

{ #category : 'Accessing' }
RestaurantType >> asiatisch: aString [

	"<aString: iOf String, ^self>"
	"Set the asiatisch of the receiver"

	asiatisch := aString
]

{ #category : 'Accessing' }
RestaurantType >> baecker [

	"<^iOf String>"
	"Answer the baecker of the receiver"

	^baecker
]

{ #category : 'Accessing' }
RestaurantType >> baecker: aString [

	"<aString: iOf String, ^self>"
	"Set the baecker of the receiver"

	baecker := aString
]

{ #category : 'Accessing' }
RestaurantType >> burgerking [

	"<^iOf String>"
	"Answer the burgerking of the receiver"

	^burgerking
]

{ #category : 'Accessing' }
RestaurantType >> burgerking: aString [

	"<aString: iOf String, ^self>"
	"Set the burgerking of the receiver"

	burgerking := aString
]

{ #category : 'Accessing' }
RestaurantType >> doener [

	"<^iOf String>"
	"Answer the doener of the receiver"

	^doener
]

{ #category : 'Accessing' }
RestaurantType >> doener: aString [

	"<aString: iOf String, ^self>"
	"Set the doener of the receiver"

	doener := aString
]

{ #category : 'Accessing' }
RestaurantType >> mcdonalds [

	"<^iOf String>"
	"Answer the mcdonalds of the receiver"

	^mcdonalds
]

{ #category : 'Accessing' }
RestaurantType >> mcdonalds: aString [

	"<aString: iOf String, ^self>"
	"Set the mcdonalds of the receiver"

	mcdonalds := aString
]

{ #category : 'Accessing' }
RestaurantType >> metzger [

	"<^iOf String>"
	"Answer the metzger of the receiver"

	^metzger
]

{ #category : 'Accessing' }
RestaurantType >> metzger: aString [

	"<aString: iOf String, ^self>"
	"Set the metzger of the receiver"

	metzger := aString
]

{ #category : 'Accessing' }
RestaurantType >> pizzeria [

	"<^iOf String>"
	"Answer the pizzeria of the receiver"

	^pizzeria
]

{ #category : 'Accessing' }
RestaurantType >> pizzeria: aString [

	"<aString: iOf String, ^self>"
	"Set the pizzeria of the receiver"

	pizzeria := aString
]

{ #category : 'Accessing' }
RestaurantType >> subway [

	"<^iOf String>"
	"Answer the subway of the receiver"

	^subway
]

{ #category : 'Accessing' }
RestaurantType >> subway: aString [

	"<aString: iOf String, ^self>"
	"Set the subway of the receiver"

	subway := aString
]

{ #category : 'Accessing' }
RestaurantType >> supermarkt [

	"<^iOf String>"
	"Answer the supermarkt of the receiver"

	^supermarkt
]

{ #category : 'Accessing' }
RestaurantType >> supermarkt: aString [

	"<aString: iOf String, ^self>"
	"Set the supermarkt of the receiver"

	supermarkt := aString
]
