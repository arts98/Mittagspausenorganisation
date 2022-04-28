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
Restaurant >> adress [
	^adress
]

{ #category : 'accessing' }
Restaurant >> adress: anObject [
	adress := anObject
]

{ #category : 'accessing' }
Restaurant >> category [
	^category
]

{ #category : 'accessing' }
Restaurant >> category: anObject [
	category := anObject
]

{ #category : 'accessing' }
Restaurant >> location [
	^location
]

{ #category : 'accessing' }
Restaurant >> location: anObject [
	location := anObject
]

{ #category : 'accessing' }
Restaurant >> menu [
	^menu
]

{ #category : 'accessing' }
Restaurant >> menu: anObject [
	menu := anObject
]

{ #category : 'accessing' }
Restaurant >> name [
	^name
]

{ #category : 'accessing' }
Restaurant >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
Restaurant >> orders [
	^orders
]

{ #category : 'accessing' }
Restaurant >> orders: anObject [
	orders := anObject
]

{ #category : 'accessing' }
Restaurant >> review [
	^review
]

{ #category : 'accessing' }
Restaurant >> review: anObject [
	review := anObject
]

{ #category : 'accessing' }
Restaurant >> services [
	^services
]

{ #category : 'accessing' }
Restaurant >> services: anObject [
	services := anObject
]

{ #category : 'accessing' }
Restaurant >> week [
	^week
]

{ #category : 'accessing' }
Restaurant >> week: anObject [
	week := anObject
]
