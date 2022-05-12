Class {
	#name : 'MPORestaurantType',
	#superclass : 'Object',
	#classVars : [
		'RestaurantTypes'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Startup' }
MPORestaurantType class >> createRestaurantTypes [

	self restaurantTypes isNil
		ifTrue: [self restaurantTypes: (OrderedCollection new
			add: 'Doener';
			add: 'Pizzeria';
			add: 'Asiate';
			add: 'Metzger';
			add: 'Baecker';
			add: 'Fast Food';
			add: 'Supermarkt';
			yourself)]
]

{ #category : 'Accessing' }
MPORestaurantType class >> restaurantTypes [

	"<^hOf Collection of: {iOf String}>"
	"Answer the RestaurantTypes of the receiver"

	^RestaurantTypes
]

{ #category : 'Accessing' }
MPORestaurantType class >> restaurantTypes: aCollection [

	"<aCollection: hOf Collection of: {iOf String}, ^self>"
	"Set the RestaurantTypes of the receiver"

	RestaurantTypes := aCollection
]
