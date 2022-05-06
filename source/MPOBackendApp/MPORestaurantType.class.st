Class {
	#name : 'MPORestaurantType',
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

{ #category : 'Not categorized' }
MPORestaurantType class >> new [
	
	^super new
		doener: false;
		pizzeria: false;
		asiatisch: false;
		metzger: false;
		baecker: false;
		mcdonalds: false;
		burgerking: false;
		subway: false;
		supermarkt: false;
		yourself
		
]

{ #category : 'Accessing' }
MPORestaurantType >> asiatisch [

	"<^(true | false)>"
	"Answer the asiatisch of the receiver"

	^asiatisch
]

{ #category : 'Accessing' }
MPORestaurantType >> asiatisch: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the asiatisch of the receiver"

	asiatisch := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> baecker [

	"<^(true | false)>"
	"Answer the baecker of the receiver"

	^baecker
]

{ #category : 'Accessing' }
MPORestaurantType >> baecker: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the baecker of the receiver"

	baecker := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> burgerking [

	"<^(true | false)>"
	"Answer the burgerking of the receiver"

	^burgerking
]

{ #category : 'Accessing' }
MPORestaurantType >> burgerking: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the burgerking of the receiver"

	burgerking := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> doener [

	"<^(true | false)>"
	"Answer the doener of the receiver"

	^doener
]

{ #category : 'Accessing' }
MPORestaurantType >> doener: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the doener of the receiver"

	doener := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> mcdonalds [

	"<^(true | false)>"
	"Answer the mcdonalds of the receiver"

	^mcdonalds
]

{ #category : 'Accessing' }
MPORestaurantType >> mcdonalds: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the mcdonalds of the receiver"

	mcdonalds := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> metzger [

	"<^(true | false)>"
	"Answer the metzger of the receiver"

	^metzger
]

{ #category : 'Accessing' }
MPORestaurantType >> metzger: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the metzger of the receiver"

	metzger := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> pizzeria [

	"<^(true | false)>"
	"Answer the pizzeria of the receiver"

	^pizzeria
]

{ #category : 'Accessing' }
MPORestaurantType >> pizzeria: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the pizzeria of the receiver"

	pizzeria := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> subway [

	"<^(true | false)>"
	"Answer the subway of the receiver"

	^subway
]

{ #category : 'Accessing' }
MPORestaurantType >> subway: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the subway of the receiver"

	subway := aBoolean
]

{ #category : 'Accessing' }
MPORestaurantType >> supermarkt [

	"<^(true | false)>"
	"Answer the supermarkt of the receiver"

	^supermarkt
]

{ #category : 'Accessing' }
MPORestaurantType >> supermarkt: aBoolean [

	"<aBoolean: (true | false), ^self>"
	"Set the supermarkt of the receiver"

	supermarkt := aBoolean
]
