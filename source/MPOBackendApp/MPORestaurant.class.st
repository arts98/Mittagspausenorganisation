Class {
	#name : 'MPORestaurant',
	#superclass : 'Object',
	#instVars : [
		'name',
		'adress',
		'services',
		'reviews',
		'location',
		'category',
		'menu',
		'week',
		'orders',
		'description',
		'linkToWebsite'
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
				adress: 'Berta-Ottenstein-Strasse 3';
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
MPORestaurant class >> deleteRestaurant: aRestaurant [
	Restaurants remove: aRestaurant
]

{ #category : 'Not categorized' }
MPORestaurant class >> modifyRestaurant: aRestaurant [
	self restaura
]

{ #category : 'Not categorized' }
MPORestaurant class >> modifyRestaurant: aRestaurant newMenu: aStringMenu newName: aStringName newServices: aString newAdress: adress newCategory: aRestaurantType [

	"
	self restaurants do: [:eachRestaurante | (eachRestaurante = aRestaurant) ifTrue: [
			eachRestaurante adress
	]] 
	"
	
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

{ #category : 'Not categorized' }
MPORestaurant >> addOrder: anOrder toDate: aDate [
	self orders isNil
		ifTrue: [self orders: Dictionary new].
	(self orders at: aDate ifAbsentPut: [OrderedCollection new]) add: anOrder
]

{ #category : 'Not categorized' }
MPORestaurant >> addOrdertoDictionary: aString price: aNumber person: aPerson date: aDate note: aNoteString [
	| newOrder |
	newOrder := MPOOrder new.	
	newOrder person: aPerson.
	newOrder price: aNumber.
	newOrder note: aNoteString.
	newOrder food: aString.	
	self addOrder: newOrder toDate: aDate
	
	
]

{ #category : 'accessing' }
MPORestaurant >> addReview: aReview [
	self reviews add:  aReview
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
	|average|
	average := 0.
	(self reviews size = 0)
		ifTrue: [
		^0
		]
		ifFalse: [
				self reviews do: [:aReview | average := (average + aReview starRating)].		
				^(average / (self reviews size))
		].

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
MPORestaurant >> deleteOrder: anOrder atDate: aDate [
	(self orders at: aDate ifAbsent: []) remove: anOrder ifAbsent: [] 
]

{ #category : 'Not categorized' }
MPORestaurant >> deleteRestaurant: aRestaurant [
	self class deleteRestaurant: aRestaurant
]

{ #category : 'accessing' }
MPORestaurant >> deleteReview: aReview [
	self reviews remove: aReview
]

{ #category : 'accessing' }
MPORestaurant >> description [

	^description
]

{ #category : 'accessing' }
MPORestaurant >> description: aString [

	description := aString
]

{ #category : 'Not categorized' }
MPORestaurant >> getOrdersatDate: aDate [
	^(self orders at: aDate ifAbsent: []) 
]

{ #category : 'Not categorized' }
MPORestaurant >> getSortedCommentsbasedonRating [
	|sortedRatings starratingForSorting|
	sortedRatings := OrderedCollection new.
	starratingForSorting := 0.

	0 to: 5 do:[
		self reviews do: [:aReview | ( aReview starRating = starratingForSorting ) 
			ifTrue: [sortedRatings add: aReview]
		].
		starratingForSorting := starratingForSorting + 1.
	].
	^sortedRatings
	
]

{ #category : 'Not categorized' }
MPORestaurant >> getTopThreeRestaurants [
	| topThree averageofRestaurant highestRestaurant|
	averageofRestaurant := 10.
	topThree := OrderedCollection new.
	
	0 to: 3 do: [
		MPORestaurant restaurants do: [ :aRestaurant | 
			(averageofRestaurant < aRestaurant averageRating) 
				ifTrue: [ 
					(topThree includes: aRestaurant) 
						ifFalse: [
							averageofRestaurant := aRestaurant averageRating. 
							highestRestaurant := aRestaurant.]]].
		(topThree includes: highestRestaurant) 
			ifFalse: [topThree add: highestRestaurant.]].
	^topThree
]

{ #category : 'accessing' }
MPORestaurant >> linktomenu: aString [
	menu := aString
]

{ #category : 'accessing' }
MPORestaurant >> linkToWebsite [

	^linkToWebsite
]

{ #category : 'accessing' }
MPORestaurant >> linkToWebsite: aString [
	
	linkToWebsite := aString
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

{ #category : 'Not categorized' }
MPORestaurant >> modifyOrder: aOrder food: aFood person: aPerson date: aDate note: aString [
	| myorder |
	(self orders at: aDate ifAbsent: []) remove: aOrder ifAbsent: [].
	myorder := MPOOrder new.
	myorder person: aPerson.
	myorder food: aFood.
	myorder note: aString.
]

{ #category : 'Not categorized' }
MPORestaurant >> modifyRestaurant: aRestaurant [
	"self class "
]

{ #category : 'accessing' }
MPORestaurant >> name [
	^name
]

{ #category : 'accessing' }
MPORestaurant >> name: aString [
	name := aString
]

{ #category : 'Not categorized' }
MPORestaurant >> orderByTimestamp [
	
	^SortedCollection new 
		addAll: self reviews;
		yourself
]

{ #category : 'Not categorized' }
MPORestaurant >> orderReviewsByTimestamp [
	
	^SortedCollection new 
		addAll: self reviews;
		yourself
]

{ #category : 'accessing' }
MPORestaurant >> orders [
	^orders
]

{ #category : 'accessing' }
MPORestaurant >> orders: aDictionary [
	orders := aDictionary
]

{ #category : 'accessing' }
MPORestaurant >> reviews [
	^reviews
]

{ #category : 'accessing' }
MPORestaurant >> reviews: aReviewCollection [
	reviews := aReviewCollection
]

{ #category : 'accessing' }
MPORestaurant >> services [
	^services
]

{ #category : 'accessing' }
MPORestaurant >> services: aFoodCollection [
	services := aFoodCollection
]

{ #category : 'Not categorized' }
MPORestaurant >> sumOfOrderPerson: aPerson atDate: aDate [
	|sum|
	sum := 0.
	(self orders at: aDate ifAbsent: []) do: [ :orderelm  | (orderelm person = aPerson) ifTrue: [
		orderelm food do: [ :foodelem | sum := (sum + foodelem price)]
	]		
	].

	^sum
]

{ #category : 'Not categorized' }
MPORestaurant >> sumofOrderPrice: aDate [
	|sum|
	sum := 0.	
	(self orders at: aDate ifAbsent: []) do: [ :orderelm | sum := (sum + orderelm price)].
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
