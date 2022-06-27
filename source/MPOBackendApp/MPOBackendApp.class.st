Class {
	#name : 'MPOBackendApp',
	#superclass : 'Application',
	#category : 'MPOBackendApp'
}

{ #category : 'Tonel-Metadata' }
MPOBackendApp class >> startUp [

	MPOPerson fillPersons.
	MPORestaurant createRestaurants.
	MPORestaurantType createRestaurantTypes
]
