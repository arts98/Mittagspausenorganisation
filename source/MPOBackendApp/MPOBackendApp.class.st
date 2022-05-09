Class {
	#name : 'MPOBackendApp',
	#superclass : 'Application',
	#category : 'MPOBackendApp'
}

{ #category : 'Tonel-Metadata' }
MPOBackendApp class >> startUp [

	MPORestaurant createRestaurants.
	MPOPerson fillPersons
]
