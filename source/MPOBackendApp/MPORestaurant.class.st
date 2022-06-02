Class {
	#name : 'MPORestaurant',
	#superclass : 'Object',
	#instVars : [
		'name',
		'address',
		'description',
		'category',
		'linkToMenu',
		'linkToWebsite',
		'location',
		'reviews',
		'week',
		'orders'
	],
	#classVars : [
		'Restaurants'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'Startup' }
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
					description: 'Beschreibung von Mr Doener';
					week: theOpeningTime;
					orders: (Dictionary new
						at: (Date new year: 2022 month: 5 day: 25)
						put: (OrderedCollection new
							add: (MPOOrder new
								food: 'Doener';
								note: 'Scharf';
								price: 4;
								person: (MPOPerson persons at: 'silas.schulz@hs-furtwangen.de' ifAbsent: []);
								yourself);
							add: (MPOOrder new
								food: 'Doener Box';
								note: 'Viel Sosse';
								price: 4;
								person: (MPOPerson persons at: 'leonard.lemke@hs-furtwangen.de' ifAbsent: []);
								yourself);
							add: (MPOOrder new
								food: 'Salamipizza';
								note: '';
								price: 6.5;
								person: (MPOPerson persons at: 'max.brombach@hs-furtwangen.de' ifAbsent: []);
								yourself); 
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
				category: 'Fast Food';
				description: 'Beschreibung von Hier und Jetzt';
				week: theOpeningTime;
				orders: (Dictionary new
						at: (Date new year: 2022 month: 5 day: 25)
						put: (OrderedCollection new
							add: (MPOOrder new
								food: 'Essen';
								note: '';
								price: 12;
								person: (MPOPerson persons at: 'katrin.arts@hs-furtwangen.de' ifAbsent: []);
								yourself);
							add: (MPOOrder new
								food: 'Gericht';
								note: '';
								price: 15.5;
								person: (MPOPerson persons at: 'siyar.kartal@hs-furtwangen.de' ifAbsent: []);
								yourself); 
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
				category: 'Pizzeria';
				description: 'Beschreibung von Die Kantina';
				week: theOpeningTime;
				orders: (Dictionary new
						at: (Date new year: 2022 month: 5 day: 25)
						put: (OrderedCollection new
							add: (MPOOrder new
								food: 'Mensamahl 1';
								note: '';
								price: 12;
								person: (MPOPerson persons at: 'katrin.arts@hs-furtwangen.de' ifAbsent: []);
								yourself);
							add: (MPOOrder new
								food: 'Mensamahl 2';
								note: '';
								price: 15.5;
								person: (MPOPerson persons at: 'siyar.kartal@hs-furtwangen.de' ifAbsent: []);
								yourself); 
							yourself);
						yourself);
				yourself).]
]

{ #category : 'logic' }
MPORestaurant class >> deleteRestaurant: aRestaurant [

	self restaurants remove: aRestaurant
]

{ #category : 'logic' }
MPORestaurant class >> modifyRestaurant: aRestaurant [

	"self restaura"
]

{ #category : 'logic' }
MPORestaurant class >> modifyRestaurant: aRestaurant newMenu: aStringMenu newName: aStringName newServices: aString newAdress: adress newCategory: aRestaurantType [

	"
	self restaurants do: [:eachRestaurante | (eachRestaurante = aRestaurant) ifTrue: [
			eachRestaurante adress
	]] 
	"
	
]

{ #category : 'Accessing' }
MPORestaurant class >> restaurants [

	"<^hOf Collection of: {iOf Restaurants}>"
	"Answer the Restaurants"
	
	^Restaurants
]

{ #category : 'Accessing' }
MPORestaurant class >> restaurants: aCollection [

	"<aCollection: hOf Collection of: {iOf Restaurant}, ^self>"
	"Set the restaurants of the receiver"
	
	Restaurants := aCollection
]

{ #category : 'logic' }
MPORestaurant >> addOrder: anOrder toDate: aDate [

	self orders isNil
		ifTrue: [self orders: Dictionary new].
	(self orders at: aDate ifAbsentPut: [OrderedCollection new]) add: anOrder
]

{ #category : 'logic' }
MPORestaurant >> addOrdertoDictionary: aString price: aNumber person: aPerson date: aDate note: aNoteString [

	| newOrder |
	newOrder := (MPOOrder new
		person: aPerson;
		price: aNumber;
		note: aNoteString;
		food: aString;
		yourself).
	
	self addOrder: newOrder toDate: aDate
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

{ #category : 'logic' }
MPORestaurant >> addReview: aReview [

	self reviews add:  aReview
]

{ #category : 'logic' }
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

{ #category : 'Accessing' }
MPORestaurant >> category [

	"<^iOf String>"
	"Answer the category of the receiver"

	^category
]

{ #category : 'Accessing' }
MPORestaurant >> category: aString [

	"<aString: iOf String, ^self>"
	"Set the category of the receiver"

	category := aString
]

{ #category : 'logic' }
MPORestaurant >> deleteOrder: anOrder atDate: aDate [

	(self orders at: aDate ifAbsent: []) remove: anOrder ifAbsent: [] 
]

{ #category : 'logic' }
MPORestaurant >> deleteRestaurant: aRestaurant [

	self class deleteRestaurant: aRestaurant
]

{ #category : 'logic' }
MPORestaurant >> deleteReview: aReview [

	self reviews remove: aReview
]

{ #category : 'Accessing' }
MPORestaurant >> description [

	"<^iOf String>"
	"Answer the description of the receiver"

	^description
]

{ #category : 'Accessing' }
MPORestaurant >> description: aString [

	"<aString: iOf String, ^self>"
	"Set the description of the receiver"

	description := aString
]

{ #category : 'logic' }
MPORestaurant >> getOrdersatDate: aDate [

	self orders isEmptyOrNil
	ifTrue: [^nil] 
	ifFalse: [^(self orders at: aDate ifAbsent: []) ]
	
]

{ #category : 'logic' }
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

{ #category : 'logic' }
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

{ #category : 'Accessing' }
MPORestaurant >> linkToWebsite [

	"<^iOf String>"
	"Answer the linkToWebsite of the receiver"

	^linkToWebsite
]

{ #category : 'Accessing' }
MPORestaurant >> linkToWebsite: aString [

	"<aString: iOf String, ^self>"
	"Set the linkToWebsite of the receiver"

	linkToWebsite := aString
]

{ #category : 'Accessing' }
MPORestaurant >> location [

	"<^iOf String>"
	"Answer the location of the receiver"

	^location
]

{ #category : 'Accessing' }
MPORestaurant >> location: aString [

	"<aString: iOf String, ^self>"
	"Set the location of the receiver"

	location := aString
]

{ #category : 'logic' }
MPORestaurant >> modifyOrder: aOrder food: aFood person: aPerson date: aDate note: aString [

	| myorder |
	(self orders at: aDate ifAbsent: []) remove: aOrder ifAbsent: [].
	myorder := MPOOrder new.
	myorder person: aPerson.
	myorder food: aFood.
	myorder note: aString.
]

{ #category : 'logic' }
MPORestaurant >> modifyRestaurant: aRestaurant [
	"self class "
]

{ #category : 'Accessing' }
MPORestaurant >> name [

	"<^iOf String>"
	"Answer the name of the receiver"

	^name
]

{ #category : 'Accessing' }
MPORestaurant >> name: aString [

	"<aString: iOf String, ^self>"
	"Set the name of the receiver"

	name := aString
]

{ #category : 'logic' }
MPORestaurant >> orderByTimestamp [
	
	^SortedCollection new 
		addAll: self reviews;
		yourself
]

{ #category : 'logic' }
MPORestaurant >> orderReviewsByTimestamp [
	
	^SortedCollection new 
		addAll: self reviews;
		yourself
]

{ #category : 'Accessing' }
MPORestaurant >> orders [

	"<^hOf Dictionary: {key: iOf Date, value: iOf OrderedCollection}>"
	"Answer the orders of the receiver"

	^orders
]

{ #category : 'Accessing' }
MPORestaurant >> orders: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf Date, value: iOf OrderedCollection}, ^self>"
	"Set the orders of the receiver"

	orders := aDictionary
]

{ #category : 'Accessing' }
MPORestaurant >> reviews [

	"<^hOf Dictionary: {key: iOf Date, value: iOf MPORating}>"
	"Answer the reviews of the receiver"

	^reviews
]

{ #category : 'Accessing' }
MPORestaurant >> reviews: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf Date, value: iOf MPORating}, ^self>"
	"Set the reviews of the receiver"

	reviews := aDictionary
]

{ #category : 'logic' }
MPORestaurant >> sumOfOrderPerson: aPerson atDate: aDate [

	|sum|
	sum := 0.
	(self orders at: aDate ifAbsent: []) do: [ :orderelm  | (orderelm person = aPerson) ifTrue: [
		orderelm food do: [ :foodelem | sum := (sum + foodelem price)]
	]		
	].

	^sum
]

{ #category : 'logic' }
MPORestaurant >> sumofOrderPrice: aDate [

	|sum|
	sum := 0.	
	(self orders at: aDate ifAbsent: []) do: [ :orderelm | sum := (sum + orderelm price)].
	^sum
]

{ #category : 'Accessing' }
MPORestaurant >> week [

	"<^iOf MPOOpeningTime>"
	"Answer the week of the receiver"

	^week
]

{ #category : 'Accessing' }
MPORestaurant >> week: aMPOOpeningTime [

	"<aMPOOpeningTime: iOf MPOOpeningTime, ^self>"
	"Set the week of the receiver"

	week := aMPOOpeningTime
]
