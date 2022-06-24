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
		'openingTime',
		'orders'
	],
	#classVars : [
		'Restaurants'
	],
	#category : 'MPOBackendApp'
}

{ #category : 'logic' }
MPORestaurant class >> addRestaurant: aRestaurant [

	self restaurants add: aRestaurant
]

{ #category : 'Startup' }
MPORestaurant class >> createRestaurants [

	self restaurants isEmptyOrNil
		ifTrue: [
			self restaurants: (OrderedCollection new
				add: (MPORestaurant new
					name: 'Mr Doener';
					address: 'Eschholzstrasse 76';
					location: 'Freiburg';
					category: 'Doener';
					description: 'Beschreibung von Mr Doener';
					reviews: (OrderedCollection new
							add: (MPORating new
								note: 'lecker';
								starRating: 4;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '10:15:26');
								yourself);
							add: (MPORating new
								note: 'extraklasse';
								starRating: 5;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '12:15:00');
								yourself);
							add: (MPORating new
								note: 'sehr gut';
								starRating: 5;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '22:10:00');
								yourself);
						yourself);
					openingTime: (MPOOpeningTime new
						addOpeningTime: '10:30 - 23:00' atDay: 'Montag';
						addOpeningTime: '10:30 - 23:00' atDay: 'Dienstag';
						addOpeningTime: '10:30 - 23:00' atDay: 'Mittwoch';
						addOpeningTime: '10:30 - 23:00' atDay: 'Donnerstag';
						addOpeningTime: '10:30 - 24:00' atDay: 'Freitag';
						addOpeningTime: '10:30 - 24:00' atDay: 'Samstag';
						addOpeningTime: '11:30 - 23:00' atDay: 'Sonntag';
						yourself);
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
				add: (MPORestaurant new
					name: 'Hier und Jetzt';
					address: 'Zaehringer Str. 44';
					location: 'Freiburg';
					category: 'Fast Food';
					description: 'Beschreibung von Hier und Jetzt';
					reviews: (OrderedCollection new
							add: (MPORating new
								note: 'klasse';
								starRating: 5;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '10:15:26');
								yourself);
							add: (MPORating new
								note: 'geht';
								starRating: 2;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '12:15:00');
								yourself);
							add: (MPORating new
								note: 'schlecht';
								starRating: 1;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '22:10:00');
								yourself);
						yourself);
					openingTime: (MPOOpeningTime new
						addOpeningTime: '12:00 - 14:00' atDay: 'Montag';
						addOpeningTime: '12:00 - 14:00' atDay: 'Dienstag';
						addOpeningTime: '12:00 - 14:00, 17:30 - 23:00' atDay: 'Mittwoch';
						addOpeningTime: '12:00 - 14:00, 17:30 - 23:00' atDay: 'Donnerstag';
						addOpeningTime: '12:00 - 14:00, 17:30 - 23:00' atDay: 'Freitag';
						addOpeningTime: '17:30 - 23:00' atDay: 'Samstag';
						addOpeningTime: '17:30 - 23:00' atDay: 'Sonntag';
						yourself);
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
					yourself);
				add: (MPORestaurant new
					name: 'Die Kantina';
					address: 'Berta-Ottenstein-Strasse 3';
					location: 'Freiburg';
					category: 'Pizzeria';
					description: 'Beschreibung von Die Kantina';
					reviews: (OrderedCollection new
							add: (MPORating new
								note: 'Mega';
								starRating: 5;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '10:15:26');
								yourself);
							add: (MPORating new
								note: 'mager';
								starRating: 1;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '12:15:00');
								yourself);
							add: (MPORating new
								note: 'sehr gut';
								starRating: 5;
								timestamp: (AbtTimestamp date: (Date new year: 2022 month: 5 day: 25) time: '22:10:00');
								yourself);
						yourself);
					openingTime: (MPOOpeningTime new
						addOpeningTime: '11:30 - 24:00' atDay: 'Montag';
						addOpeningTime: '11:30 - 24:00' atDay: 'Dienstag';
						addOpeningTime: '11:30 - 24:00' atDay: 'Mittwoch';
						addOpeningTime: '11:30 - 24:00' atDay: 'Donnerstag';
						addOpeningTime: '11:30 - 24:00' atDay: 'Freitag';
						addOpeningTime: '15:00 - 24:00' atDay: 'Samstag';
						addOpeningTime: '10:00 - 24:00' atDay: 'Sonntag';
						yourself);
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
					yourself);
				yourself).]
]

{ #category : 'logic' }
MPORestaurant class >> deleteRestaurant: aRestaurant [

	self restaurants remove: aRestaurant
]

{ #category : 'logic' }
MPORestaurant class >> getTopThreeRestaurants [

	| theSortedCollection theTopThree |
	
	theSortedCollection := SortedCollection new.
	theSortedCollection addAll: self restaurants.
	theTopThree := theSortedCollection last: 3.
	
	^theTopThree
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
MPORestaurant class >> sortRestaurantsByMostOrdersAtDate: aDate [
	
	^SortedCollection new
		sortBlock: [ :theFirstRestaurant :theSecondRestaurant | 
			(theFirstRestaurant orders at: aDate ifAbsent: [0]) size > (theSecondRestaurant orders at: aDate ifAbsent: [0]) size];
		addAll: self restaurants;
		yourself
	
]

{ #category : 'logic' }
MPORestaurant >> <= aRestaurant [

	^self averageRating <= aRestaurant averageRating

]

{ #category : 'logic' }
MPORestaurant >> addOrder: anOrder toDate: aDate [

	self orders isNil
		ifTrue: [self orders: Dictionary new].
	(self orders at: aDate ifAbsentPut: [OrderedCollection new]) add: anOrder
]

{ #category : 'logic' }
MPORestaurant >> addOrderToDictionary: aString price: aNumber person: aPerson date: aDate note: aNoteString [

	| theOrder |
	theOrder := (MPOOrder new
		person: aPerson;
		price: aNumber;
		note: aNoteString;
		food: aString;
		yourself).
	
	self addOrder: theOrder toDate: aDate
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
MPORestaurant >> addRestaurant: aRestaurant [

	self class addRestaurant: aRestaurant
]

{ #category : 'logic' }
MPORestaurant >> addReview: aReview [

	self reviews add: aReview
]

{ #category : 'logic' }
MPORestaurant >> averageRating [

	^(self reviews size = 0)
		ifTrue: [
			0
		]
		ifFalse: [
			((self reviews inject: 0 into: [:theSum :eachReview | theSum + eachReview starRating ]) / self reviews size ) asFloat roundTo: 0.01
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

	(self orders at: aDate ifAbsent: [^nil]) remove: anOrder ifAbsent: [] 
]

{ #category : 'logic' }
MPORestaurant >> deleteRestaurant: aRestaurant [

	self class deleteRestaurant: aRestaurant
]

{ #category : 'logic' }
MPORestaurant >> deleteReview: aReview [

	self reviews remove: aReview ifAbsent: []
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
MPORestaurant >> getOrdersAtDate: aDate [

	^self orders isEmptyOrNil
		ifFalse: [self orders at: aDate ifAbsent: []]
	
]

{ #category : 'logic' }
MPORestaurant >> getSortedBestCommentsBasedOnRating [

	| theSortedRating theStarratingForSorting |
	theSortedRating := OrderedCollection new.
	theStarratingForSorting := 5. 

	0 to: 5 do:[ :eachNumber |
		self reviews do: [:eachReview | ( eachReview starRating = theStarratingForSorting ) 
			ifTrue: [theSortedRating add: eachReview]
		].
		theStarratingForSorting := theStarratingForSorting - 1.
	].
	^theSortedRating

]

{ #category : 'logic' }
MPORestaurant >> getSortedCommentsBasedOnRating [

	| theSortedRating theStarratingForSorting |
	theSortedRating := OrderedCollection new.
	theStarratingForSorting := 0.

	0 to: 5 do:[ :eachNumber |
		self reviews do: [:eachReview | ( eachReview starRating = theStarratingForSorting ) 
			ifTrue: [theSortedRating add: eachReview]
		].
		theStarratingForSorting := theStarratingForSorting + 1.
	].
	^theSortedRating
	
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
MPORestaurant >> modifyOrder: aOrder food: aFood person: aPerson oldDate: anOldDate newDate: aNewDate note: aString price: aNumber [

	self deleteOrder: aOrder atDate: anOldDate.
	aOrder food: aFood.
	aOrder person: aPerson.
	aOrder note: aString.
	aOrder price: aNumber.
	self addOrder: aOrder toDate: aNewDate.

	
]

{ #category : 'logic' }
MPORestaurant >> modifyRestaurantWithAddress: anAddressString category: aCategoryString description: aDescriptionString linkToMenu: aLinktoMenuString linkToWebsite: aLinkToWebsiteString location: aLocationString name: aNameString [

	self address: anAddressString.
	self category: aCategoryString.
	self description: aDescriptionString.
	self linkToMenu: aLinktoMenuString.
	self linkToWebsite: aLinkToWebsiteString.
	self location: aLocationString.
	self name: aNameString.
	^self
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

{ #category : 'Accessing' }
MPORestaurant >> openingTime [

	"<^iOf MPOOpeningTime>"
	"Answer the openingTime of the receiver"

	^openingTime
]

{ #category : 'Accessing' }
MPORestaurant >> openingTime: aMPOOpeningTime [

	"<aMPOOpeningTime: iOf MPOOpeningTime, ^self>"
	"Set the openingTime of the receiver"

	openingTime := aMPOOpeningTime
]

{ #category : 'logic' }
MPORestaurant >> orderReviewsByTimestamp [
	self reviews isNil
	ifFalse: [
	^SortedCollection new 
		addAll: self reviews;
		yourself
	]
	
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
MPORestaurant >> sortRestaurantsByMostOrdersAtDate: aDate [

	self class sortRestaurantsByMostOrdersAtDate: aDate
]

{ #category : 'logic' }
MPORestaurant >> sumOfOrderPerson: aPerson atDate: aDate [

	| theSum |
	theSum := 0.
	(self orders at: aDate ifAbsent: []) do: [ :eachOrder  | (eachOrder person = aPerson) ifTrue: [
		eachOrder food do: [ :foodelem | theSum := (theSum + foodelem price)]
	]		
	].

	^theSum
]

{ #category : 'logic' }
MPORestaurant >> sumOfOrderPrice: aDate [

	| theSum |
	theSum := 0.	
	(self orders at: aDate ifAbsent: []) do: [ :eachOrder | theSum := (theSum + eachOrder price)].
	^theSum
]
