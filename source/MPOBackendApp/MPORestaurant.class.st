Class {
	#name : 'MPORestaurant',
	#superclass : 'Object',
	#instVars : [
		'name',
		'adress',
		'services',
		'review',
		'location',
		'category',
		'menu',
		'week',
		'orders'
	],
	#classVars : [
		'Restaurants'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Not categorized' }
MPORestaurant class >> createRestaurants [

	self restaurants isEmptyOrNil
		ifTrue: [ | theOpeningTime |
			theOpeningTime := MPOOpeningTime new.
			theOpeningTime week 
				at: 'Montag' put: '10:30 am - 11:00 pm';
				at: 'Dienstag' put: '10:30 am - 11:00 pm';
				at: 'Mittwoch' put: '10:30 am - 11:00 pm';
				at: 'Donnerstag' put: '10:30 am - 11:00 pm';
				at: 'Freitag' put: '10:30 am - 12:00 pm';
				at: 'Samstag' put: '10:30 am - 12:00 pm';
				at: 'Sonntag' put: '11:30 am - 11:00 pm';
				yourself.
			
			self restaurants: (OrderedCollection new
				add: (MPORestaurant new
					name: 'Mr Doener';
					adress: 'Eschholzstrasse 76';
					location: 'Freiburg';
					category: 'Doener';
					services: (OrderedCollection new
						add: (MPOFood new
							name: 'doener';
							vegetarian: false;
							price: 5.5;
							yourself);
						add: (MPOFood new
							name: 'Pizza Vegetaria';
							vegetarian: true;
							price: 7.5;
							yourself);
						yourself);
					week: theOpeningTime;
				yourself);
			yourself).
				
			theOpeningTime := MPOOpeningTime new.
			theOpeningTime week
				at: 'Montag' put: '12:00 - 14:00';
				at: 'Dienstag' put: '12:00 - 14:00';
				at: 'Mittwoch' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Donnerstag' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Freitag' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Samstag' put: '17:30 - 23:00';
				at: 'Sonntag' put: '17:30 - 23:00';
				yourself.
				
			self restaurants add: (MPORestaurant new
				name: 'Hier und Jetzt';
				adress: 'Zaehringer Str. 44';
				location: 'Freiburg';
				category: '';
				services: (OrderedCollection new	
					add: (MPOFood new
						name: 'Mittagstisch 1';
						vegetarian: false;
						price: 10.20;
						yourself);
					add: (MPOFood new
						name: 'Mittagstisch 2';
						vegetarian: true;
						price: 9.20;
						yourself);
					yourself);
				week: theOpeningTime;
				yourself).
			
			theOpeningTime := MPOOpeningTime new.
					theOpeningTime week
						at: 'Montag' put: '11:30 - 00:00';
						at: 'Dienstag' put: '11:30 - 00:00';
						at: 'Mittwoch' put: '11:30 - 00:00';
						at: 'Donnerstag' put: '11:30 - 00:00';
						at: 'Freitag' put: '11:30 - 00:00';
						at: 'Samstag' put: '15:00 - 00:00';
						at: 'Sonntag' put: '10:00 - 00:00';
						yourself.	
			
			self restaurants add: (MPORestaurant new
				name: 'Die Kantina';
				adress: 'Berta-Ottenstein-Straße 3';
				location: 'Freiburg';
				category: '';
				services: (OrderedCollection new
					add: (MPOFood new
						name: 'Mittagstisch mit Fleisch';
						vegetarian: false;
						price: 12;
						yourself);
					add: (MPOFood new
						name: 'Vegetarischer Mittagstisch';
						vegetarian: true;
						price: 11;
						yourself);
					yourself);
				week: theOpeningTime;
				yourself)]
]

{ #category : 'Not categorized' }
MPORestaurant class >> restaurants [

	"<^hOf Collection of: {iOf Restaurants}>"
	"Answer the Restaurants"
	
	^Restaurants
]

{ #category : 'Not categorized' }
MPORestaurant class >> restaurants: aCollection [

	"<aCollection: hOf Collection of: {iOf Restaurant}, ^self>"
	"Set the restaurants of the receiver"
	
	Restaurants := aCollection
]

{ #category : 'accessing' }
MPORestaurant >> addOrder: anOrder [
	self orders add: anOrder
]

{ #category : 'accessing' }
MPORestaurant >> addReview: aReview [
	self review add:  aReview
]

{ #category : 'accessing' }
MPORestaurant >> adress [
	^adress
]

{ #category : 'accessing' }
MPORestaurant >> adress: aString [
	adress := aString
]

{ #category : 'Not categorized' }
MPORestaurant >> averageRating [
	
	|avg|
	avg := 0.
	self review do: [:rev | 
		avg := (avg + rev starRating)].
	^(avg / (self review size))
]

{ #category : 'accessing' }
MPORestaurant >> category [
	^category
]

{ #category : 'accessing' }
MPORestaurant >> category: aRestaurantType [
	category := aRestaurantType
]

{ #category : 'Not categorized' }
MPORestaurant >> delete [

	"<^self>"
	"Answer the receiver"

	self
]

{ #category : 'Not categorized' }
MPORestaurant >> deleteOrder: anOrder [
	"deleteOrder"
]

{ #category : 'accessing' }
MPORestaurant >> deleteReview: aReview [
	self review remove: aReview
]

{ #category : 'accessing' }
MPORestaurant >> location [
	^location
]

{ #category : 'accessing' }
MPORestaurant >> location: aLocation [
	location := aLocation
]

{ #category : 'accessing' }
MPORestaurant >> menu [
	^menu
]

{ #category : 'accessing' }
MPORestaurant >> menu: aString [
	menu := aString
]

{ #category : 'accessing' }
MPORestaurant >> modifyOrder: aOrder food: aFood person: aPerson [
	self orders do: [:each | (each = aOrder) ifTrue: [each person: aPerson. each food: aFood]].
]

{ #category : 'accessing' }
MPORestaurant >> name [
	^name
]

{ #category : 'accessing' }
MPORestaurant >> name: aString [
	name := aString
]

{ #category : 'accessing' }
MPORestaurant >> orders [
	^orders
]

{ #category : 'accessing' }
MPORestaurant >> orders: anOrderCollection [
	orders := anOrderCollection
]

{ #category : 'accessing' }
MPORestaurant >> review [
	^review
]

{ #category : 'accessing' }
MPORestaurant >> review: aReviewCollection [
	review := aReviewCollection
]

{ #category : 'accessing' }
MPORestaurant >> services [
	^services
]

{ #category : 'accessing' }
MPORestaurant >> services: aFoodCollection [
	services := aFoodCollection
]

{ #category : 'accessing' }
MPORestaurant >> sumOfOrderPerson: aPerson [
	
	|sum|
	sum := 0.
	self orders do: [ :orderelm  | 
		(orderelm person = aPerson) 
			ifTrue: [
				orderelm food do: [ :foodelem | 
					sum := (sum + foodelem price)]]].
	^sum
]

{ #category : 'accessing' }
MPORestaurant >> sumofOrderPrice [

	|sum|
	sum := 0.
	self orders do: [ :orderelm | 
		sum := (sum + orderelm priceOfOrder )].
	^sum
]

{ #category : 'accessing' }
MPORestaurant >> week [
	^week
]

{ #category : 'accessing' }
MPORestaurant >> week: anObject [
	week := anObject
]
