Class {
	#name : 'MPOMe5NewRestaurantFormModalModalView',
	#superclass : 'MPOMe5RestaurantsView',
	#instVars : [
		'nameField',
		'restaurantTypeSelectBox',
		'descriptionTextArea',
		'website',
		'menuLink',
		'address',
		'oldRestaurant'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Layout' }
MPOMe5NewRestaurantFormModalModalView class >> layoutClass [

	"<^hOf BsBaseLayout class>"
	"Answer the receiver's layout."

	^Me5ModalViewLayout
]

{ #category : 'Initial-Events' }
MPOMe5NewRestaurantFormModalModalView class >> new: aRestaurant [
	| theNewObject |
	theNewObject := self new.
	theNewObject oldRestaurant: aRestaurant.
	^theNewObject
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> address [

	"<^iOf TextField>"
	"Answer the address of the receiver"

	^address
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> address: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the address of the receiver"

	address := aTextField
]

{ #category : 'Initial-Events' }
MPOMe5NewRestaurantFormModalModalView >> afterCreateComponents [
	"doNothing"
]

{ #category : 'Initial-Events' }
MPOMe5NewRestaurantFormModalModalView >> createComponents [
	self modal
		title: 'Neues Restaurant';
		addChildToBody:(Me5Form new		
			addChildToBody: (nameField := Me5TextField new
				text: 'Name';
				helpText: 'Restaurant-Name.';
				focus;
				yourself);
			addChildToBody: (restaurantTypeSelectBox := Me5SelectBox new
				text: 'Typ';
				addObjects: MPORestaurantType restaurantTypes;
				yourself);
			addChildToBody: (descriptionTextArea := Me5TextArea new
				text: 'Beschreibung';
				helpText: 'Restaurant-Beschreibung.';
				yourself);
			addChildToBody: (website := Me5TextField new
				text: 'Webseite';
				helpText: 'Muss mit https:// beginnen.';
				yourself);
			addChildToBody: (menuLink := Me5TextField new
				text: 'Link zur Speisekarte';
				helpText: 'Muss mit https:// beginnen.';
				yourself);
			addChildToBody: (address := Me5TextField new
				text: 'Adresse';
				helpText: 'Adresse des Restaurants';
				yourself);
			yourself);
			addChildToFoot: (Me5Column new
				addChild: (Me5Button newPrimary
					text: 'Ok';
					addClickEventSelector:  #saveRestaurantClicked;
					yourself);
				addChild: (Me5Button newPrimary
					text: 'Abbrechen';
					dataDismiss: MeConstantModal;
					yourself);
				yourself);
			yourself.
			
			self oldRestaurant isNil
			ifFalse: [
				self nameField value: self oldRestaurant name.
				self restaurantTypeSelectBox value: self oldRestaurant category.
				self descriptionTextArea value: self oldRestaurant description.
				self website value: self oldRestaurant linkToWebsite.
				self menuLink value: self oldRestaurant linkToMenu.
				self address value: self oldRestaurant address.
			] 
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> descriptionTextArea [

	^descriptionTextArea
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> descriptionTextArea: aTextArea [

	descriptionTextArea := aTextArea
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> menuLink [

	"<^iOf TextField>"
	"Answer the menuLink of the receiver"

	^menuLink
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> menuLink: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the menuLink of the receiver"

	menuLink := aTextField
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> nameField [

	"<^iOf TextField>"
	"Answer the nameField of the receiver"

	^nameField
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> nameField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the nameField of the receiver"

	nameField := aTextField
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> oldRestaurant [

	"<^iOf MPORestaurant>"
	"Answer the oldRestaurant of the receiver"

	^oldRestaurant
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> oldRestaurant: aMPORestaurant [

	"<aMPORestaurant: iOf MPORestaurant, ^self>"
	"Set the oldRestaurant of the receiver"

	oldRestaurant := aMPORestaurant
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> restaurantTypeSelectBox [

	"<^iOf SelectBox>"
	"Answer the restaurantTypeSelectBox of the receiver"

	^restaurantTypeSelectBox
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> restaurantTypeSelectBox: aSelectBox [

	"<aSelectBox: iOf SelectBox, ^self>"
	"Set the restaurantTypeSelectBox of the receiver"

	restaurantTypeSelectBox := aSelectBox
]

{ #category : 'Events' }
MPOMe5NewRestaurantFormModalModalView >> saveRestaurantClicked [
	self nameField hasValue
		ifFalse: [
				self nameField dangerText: 'Bitte gib einen Namen ein.']
		ifTrue: [
			self oldRestaurant isNil
				ifFalse: [
					self parentView currentRestaurant: (self oldRestaurant
						modifyRestaurantWithAddress: (self address value ifEmpty: nil)
						category: self restaurantTypeSelectBox value
						description: self descriptionTextArea value
						linkToMenu:  (self menuLink value ifEmpty: nil)
						linkToWebsite:  (self website value ifEmpty: nil)
						location: nil
						name: self nameField value).
				]
				ifTrue: [
					self parentView currentRestaurant: (MPORestaurant addRestaurant: (MPORestaurant new
						name: self nameField value;
						category: self restaurantTypeSelectBox value;
						description: self descriptionTextArea value;
						linkToWebsite: (self website value ifEmpty: nil);
						linkToMenu: (self menuLink value ifEmpty: nil);
						reviews: (OrderedCollection new);
						address: (self address value ifEmpty: nil);
						yourself)). 
				].
				self parentView refreshRestaurants.
				self closeModal
			]
				

]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> website [

	"<^iOf TextField>"
	"Answer the website of the receiver"

	^website
]

{ #category : 'Accessing' }
MPOMe5NewRestaurantFormModalModalView >> website: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the website of the receiver"

	website := aTextField
]
