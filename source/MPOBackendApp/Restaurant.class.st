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
	#category : 'MPOBackendApp'
}

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
