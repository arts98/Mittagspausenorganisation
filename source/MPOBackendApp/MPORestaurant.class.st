Class {
	#name : 'MPORestaurant',
	#superclass : 'Object',
	#instVars : [
		'name',
		'address',
		'services',
		'reviews',
		'location',
		'category',
		'linkToMenu',
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
					address: 'Eschholzstrasse 76';
					location: 'Freiburg';
					category: 'Doener';
					week: theOpeningTime;
					orders: (Dictionary new
						at: (Date new year: 2022 month: 5 day: 25)
						put: (MPOOrder new
							food: 'Doener';
							note: 'Scharf';
							price: 4;
							person: (MPOPerson persons at: 'silas.schulz@hs-furtwangen.de' ifAbsent: []);
							yourself);
						at: (Date new year: 2022 month: 5 day: 25)
						put: (MPOOrder new
							food: 'Doener Box';
							note: 'Viel Sosse';
							price: 4;
							person: (MPOPerson persons at: 'leonard.lemke@hs-furtwangen.de' ifAbsent: []);
							yourself);
						at: (Date new year: 2022 month: 5 day: 27)
						put: (MPOOrder new
							food: 'Salamipizza';
							note: '';
							price: 6.5;
							person: (MPOPerson persons at: 'max.brombach@hs-furtwangen.de' ifAbsent: []);
							yourself);
						yourself);
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
				address: 'Zaehringer Str. 44';
				location: 'Freiburg';
				category: '';
				week: theOpeningTime;
				orders: (Dictionary new
						at: (Date new year: 2022 month: 4 day: 13)
						put: (MPOOrder new
							food: 'Essen';
							note: '';
							price: 12;
							person: (MPOPerson persons at: 'katrin.arts@hs-furtwangen.de' ifAbsent: []);
							yourself);
						at: (Date new year: 2022 month: 3 day: 25)
						put: (MPOOrder new
							food: 'Gericht';
							note: '';
							price: 15.5;
							person: (MPOPerson persons at: 'siyar.kartal@hs-furtwangen.de' ifAbsent: []);
							yourself);
						yourself);
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
				address: 'Berta-Ottenstein-Strasse 3';
				location: 'Freiburg';
				category: '';
				week: theOpeningTime;
				orders: (Dictionary new
						at: (Date new year: 2022 month: 4 day: 13)
						put: (MPOOrder new
							food: 'Mensamahl 1';
							note: '';
							price: 12;
							person: (MPOPerson persons at: 'katrin.arts@hs-furtwangen.de' ifAbsent: []);
							yourself);
						at: (Date new year: 2022 month: 3 day: 25)
						put: (MPOOrder new
							food: 'Mensamahl 2';
							note: '';
							price: 15.5;
							person: (MPOPerson persons at: 'siyar.kartal@hs-furtwangen.de' ifAbsent: []);
							yourself);
						yourself);
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

{ #category : 'Not categorized' }
MPORestaurant >> addOrder: anOrder [
	self orders add: anOrder
]

{ #category : 'Not categorized' }
MPORestaurant >> addOrder: anOrder toDate: aDate [
	self orders isNil
		ifTrue: [self orders: Dictionary new].
	(self orders at: aDate ifAbsentPut: [OrderedCollection new]) add: anOrder
]

{ #category : 'Accessing' }
MPORestaurant >> address [

	"<^iOf String>"
	"Answer the address of the receiver"

	^address
]

{ #category : 'Accessing' }
MPORestaurant >> address: aString [

	"<aString: iOf String, ^self>"
	"Set the address of the receiver"

	address := aString
]

{ #category : 'accessing' }
MPORestaurant >> addReview: aReview [
	self reviews add:  aReview
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
MPORestaurant >> category: aString [
	category := aString
]

{ #category : 'accessing' }
MPORestaurant >> deleteOrder: anOrder [
	self orders remove: anOrder
]

{ #category : 'Not categorized' }
MPORestaurant >> deleteOrder: anOrder atDate: aDate [
	(self orders at: aDate ifAbsent: []) remove: anOrder ifAbsent: [] 
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

{ #category : 'Accessing' }
MPORestaurant >> linkToMenu [

	"<^iOf String>"
	"Answer the linkToMenu of the receiver"

	^linkToMenu
]

{ #category : 'Accessing' }
MPORestaurant >> linkToMenu: aString [

	"<aString: iOf String, ^self>"
	"Set the linkToMenu of the receiver"

	linkToMenu := aString
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

{ #category : 'Not categorized' }
MPORestaurant >> modifyOrder: aOrder food: aFood person: aPerson date: aDate note: aString [
	| myorder |
	(self orders at: aDate ifAbsent: []) remove: aOrder ifAbsent: [].
	myorder := MPOOrder new.
	myorder person: aPerson.
	myorder food: aFood.
	myorder note: aString.
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
