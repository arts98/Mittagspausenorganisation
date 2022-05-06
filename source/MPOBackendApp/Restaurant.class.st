Class {
	#name : 'Restaurant',
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
Restaurant class >> createRestaurants [

	self restaurants isEmptyOrNil
		ifTrue: [ | theOpeningTime |
			theOpeningTime := OpeningTime new.
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
				add: (Restaurant new
					name: 'Mr Doener';
					adress: 'EschholzstraÃƒÅ¸e 76';
					location: 'Freiburg';
					category: (RestaurantType new
						doener: true;
						yourself);
					services: (OrderedCollection new
						add: (Food new
							name: 'doener';
							vegetarian: false;
							price: 5.5;
							yourself);
						add: (Food new
							name: 'Pizza Vegetaria';
							vegetarian: true;
							price: 7.5;
							yourself);
						yourself);
					week: theOpeningTime;
				yourself);
			yourself).
				
			theOpeningTime := OpeningTime new.
			theOpeningTime week
				at: 'Montag' put: '12:00 - 14:00';
				at: 'Dienstag' put: '12:00 - 14:00';
				at: 'Mittwoch' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Donnerstag' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Freitag' put: '12:00 - 14:00, 17:30 - 23:00';
				at: 'Samstag' put: '17:30 - 23:00';
				at: 'Sonntag' put: '17:30 - 23:00';
				yourself.
				
			self restaurants add: (Restaurant new
				name: 'Hier und Jetzt';
				adress: 'ZÃƒÂ¤hringer Str. 44';
				location: 'Freiburg';
				category: RestaurantType new;
				services: (OrderedCollection new	
					add: (Food new
						name: 'Mittagstisch 1';
						vegetarian: false;
						price: 10.20;
						yourself);
					add: (Food new
						name: 'Mittagstisch 2';
						vegetarian: true;
						price: 9.20;
						yourself);
					yourself);
				week: theOpeningTime;
				yourself)]
				
			
]

{ #category : 'Not categorized' }
Restaurant class >> restaurants [

	"<^hOf Collection of: {iOf Restaurants}>"
	"Answer the Restaurants"
	
	^Restaurants
]

{ #category : 'Not categorized' }
Restaurant class >> restaurants: aCollection [

	"<aCollection: hOf Collection of: {iOf Restaurant}, ^self>"
	"Set the restaurants of the receiver"
	
	Restaurants := aCollection
]

{ #category : 'accessing' }
Restaurant >> addOrder: anOrder [
	self orders add: anOrder
]

{ #category : 'accessing' }
Restaurant >> addReview: aReview [
	self review add:  aReview
]

{ #category : 'accessing' }
Restaurant >> adress [
	^adress
]

{ #category : 'accessing' }
Restaurant >> adress: aString [
	adress := aString
]

{ #category : 'accessing' }
Restaurant >> category [
	^category
]

{ #category : 'accessing' }
Restaurant >> category: aRestaurantType [
	category := aRestaurantType
]

{ #category : 'accessing' }
Restaurant >> deleteReview: aReview [
	self review remove: aReview
]

{ #category : 'accessing' }
Restaurant >> location [
	^location
]

{ #category : 'accessing' }
Restaurant >> location: aLocation [
	location := aLocation
]

{ #category : 'accessing' }
Restaurant >> menu [
	^menu
]

{ #category : 'accessing' }
Restaurant >> menu: aString [
	menu := aString
]

{ #category : 'accessing' }
Restaurant >> name [
	^name
]

{ #category : 'accessing' }
Restaurant >> name: aString [
	name := aString
]

{ #category : 'accessing' }
Restaurant >> orders [
	^orders
]

{ #category : 'accessing' }
Restaurant >> orders: anOrderCollection [
	orders := anOrderCollection
]

{ #category : 'accessing' }
Restaurant >> review [
	^review
]

{ #category : 'accessing' }
Restaurant >> review: aReviewCollection [
	review := aReviewCollection
]

{ #category : 'accessing' }
Restaurant >> services [
	^services
]

{ #category : 'accessing' }
Restaurant >> services: aFoodCollection [
	services := aFoodCollection
]

{ #category : 'accessing' }
Restaurant >> sumofOrderPrice [
	|sum|
	sum := 0.
	self orders do: [ :orderelm | 
		orderelm food do: [ :foodelem | sum := (sum + foodelem price)]
	].
	^sum
]

{ #category : 'accessing' }
Restaurant >> week [
	^week
]

{ #category : 'accessing' }
Restaurant >> week: anObject [
	week := anObject
]
