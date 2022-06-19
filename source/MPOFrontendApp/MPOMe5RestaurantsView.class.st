Class {
	#name : 'MPOMe5RestaurantsView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'masterDetailList',
		'currentRestaurant',
		'restaurantDescriptionText',
		'restaurantRatingText',
		'orderDateField',
		'orderList',
		'ratingButton',
		'websiteButton',
		'menuButton',
		'addressButton'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Events' }
MPOMe5RestaurantsView >> addOrder: anOrder [
	self orderList addChild: (self createNewOrderListItem: anOrder)
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> addressButton [

	"<^iOf Me5A>"
	"Answer the addressRef of the receiver"

	^addressButton
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> addressButton: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the addressButton of the receiver"

	addressButton := aMe5A
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> addRestaurant: aRestaurant [
	self masterDetailList addMasterDetailListGroupItem: (
		(self createMasterDetailListGroupItemForRestaurant: aRestaurant)
		enableIsActive;
		yourself)
]

{ #category : 'Initial-Events' }
MPOMe5RestaurantsView >> afterCreateComponents [
	
	self masterDetailList newDummyListGroupItem removeComponent
]

{ #category : 'Initial-Events' }
MPOMe5RestaurantsView >> createComponents [

	self
		addChild: (masterDetailList := Me5MasterDetailList new
			masterFormPortletTitle: 'Restaurants';
			detailFormPortletTitle: 'Restaurant';
			detailFormPortletWithInlineLabelStyle;
			addChildToMasterFormPortletHeadTools: (Me5A newIconOnlySuccess
				icon: Me5I newFasPlus;
				addClickEventSelector: #newRestaurantClicked;
				yourself);
			addChildToDetailFormPortletHeadTools: (Me5Button newPillPrimary
				icon: Me5I newFasEdit;
				addClickEventSelector: #editRestaurantClicked;
				yourself);
			addChildToDetailFormPortletHeadTools: (Me5Button newPillDanger
				icon: Me5I newFasTrash;
				addClickEventSelector: #deleteRestaurantClicked;
				yourself);
			addChildToDetailFormPortletBody: (Me5Col new					
				addChild: (Me5Accordion newSeparatedTabs
					addChild: (Me5AccordionItem new
						icon: Me5I newFasInfoCircle;
						title: 'Beschreibung';
						addChildToContent:  (Me5Portlet new
							addChildToBody: (restaurantDescriptionText:= Me5P new
								text: 'Beschreibung';
								yourself);
							addChildToBody: (restaurantRatingText := Me5P new
								text: 'Durchschnittliche Bewertung: ';
								yourself);
							addChildToFootButtonGroup: (ratingButton := Me5A newPillPrimary
								addClickEventSelector: #showRatingsClicked;
								yourself);
							addChildToFootButtonGroup: (websiteButton := Me5A newPillPrimary
								href: 'https://www.google.com' ;
								text: 'Webseite';
								yourself);
							addChildToFootButtonGroup: (menuButton :=Me5A newPillPrimary
								href: 'https://www.google.com/finance' ;
								text: 'Speisekarte';
								yourself);
							addChildToFootButtonGroup: (addressButton := Me5A newPillPrimary
								href: 'https://www.google.de/maps/' ;
								text: 'Adresse';
								yourself);
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasShoppingCart;
						title: 'Bestellungen';
						addChildToContent: (orderDateField := Me5DateField new
							text: 'Datum';
							width: 400;
							value: Date today;
							enableDatePicker: true;
							setDatePickerButton;
							addChangeEventSelector: #refreshOrders;
							yourself);
						addChildToContent:  (Me5Portlet new
							addChildToBody: (orderList := Me5MetronicListGroup new
								enableHoverable;		
								yourself);								
							addChildToFootButtonGroup: (Me5Button newSuccess
								icon: Me5I newFasPlus;
								text: 'Neue Bestellung';
								addClickEventSelector: #newOrderClicked;
								yourself);
							yourself);
						expand;
						yourself);
					yourself);
				yourself);
			yourself);
		yourself. 

	self refreshRestaurants.
	self refreshOrders.


	
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> createMasterDetailListGroupItemForRestaurant: aRestaurant [

	^Me5MasterDetailListGroupItem new
		updateBlock: [ :theComponent | 
			theComponent title: aRestaurant name.
			theComponent subtitle: aRestaurant category
		];
		componentObject: aRestaurant;
		addAfterMasterDetailListGroupItemSelectedEventSelector: #itemRestaurantClicked:;
		itemSelectedWindowHistoryPushUrl: '?',  aRestaurant name;
		yourself
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> createNewOrderListItem: anOrder [

	^Me5MetronicListGroupItem new
			title: anOrder food , ' (' , anOrder price asString, ' Euro)';
			subtitle: anOrder note;			
			addChildToRightExtension: (Me5ButtonGroup newDivided
				addChild: (Me5Button newPrimary
					addCssClassBtnSm;
					icon: Me5I newFasEdit;
					componentObject: anOrder;
					addClickEventSelector: #editOrderClicked:;
					yourself);
				addChild: (Me5Button newDanger
					addCssClassBtnSm;
					icon: Me5I newFasTrash;
					componentObject: anOrder;
					addClickEventSelector: #deleteOrderClicked:;
					yourself);
				yourself)
									
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> currentRestaurant [

	"<^iOf MPORestaurant>"
	"Answer the currentRestaurant of the receiver"

	^currentRestaurant
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> currentRestaurant: anMPORestaurant [

	"<anMPORestaurant: iOf MPORestaurant, ^self>"
	"Set the currentRestaurant of the receiver"

	currentRestaurant := anMPORestaurant
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> deleteOrderClicked: aMeEvent [

	| theOrder |
	theOrder := aMeEvent componentObject.
	self currentRestaurant deleteOrder: theOrder atDate: (self orderDateField value).
	self refreshOrders

]

{ #category : 'Events' }
MPOMe5RestaurantsView >> deleteRestaurantClicked [

	MPORestaurant deleteRestaurant: currentRestaurant.
	self refreshRestaurants.
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> editOrderClicked: aMeEvent [
	
	| theOrder |
	theOrder := aMeEvent componentObject.
	self openModal: (MPOMe5NewOrderFormModalModalView new: theOrder date: (self orderDateField value)).
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> editRestaurantClicked [

	self openModal: (MPOMe5NewRestaurantFormModalModalView new: self currentRestaurant).
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> itemRestaurantClicked: anEvent [

	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [self masterDetailList detailFormClearValues]
		ifFalse: [ | theRestaurant |
			theRestaurant := anEvent componentObject.
			self currentRestaurant: theRestaurant.
			self masterDetailList detailFormPortletTitle: theRestaurant name , ' ('  , theRestaurant category, ')'.
			self restaurantDescriptionText text: theRestaurant description.
			self restaurantRatingText text: 'Durchschnittliche Bewertung: ', theRestaurant averageRating asString .
			self ratingButton text: 'Bewertungen (' , theRestaurant reviews size asString, ')' .
			self refreshOrders.
			self websiteButton href: theRestaurant linkToWebsite.
			self menuButton href: theRestaurant linkToMenu.
			theRestaurant address isEmptyOrNil
			ifTrue: [self addressButton href: nil.] 
			ifFalse: [self addressButton href: 'https://www.google.com/maps/search/?api=1&query=', theRestaurant address.]
			]
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> masterDetailList [

	"<^iOf Object>"
	"Answer the masterDetailList of the receiver"

	^masterDetailList
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> masterDetailList: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the masterDetailList of the receiver"

	masterDetailList := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> menuButton [

	"<^iOf Me5A>"
	"Answer the menuRef of the receiver"

	^menuButton
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> menuButton: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the menuButton of the receiver"

	menuButton := aMe5A
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newOrderClicked [
	self openModal: MPOMe5NewOrderFormModalModalView new
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newRestaurantClicked [
	self openModal: MPOMe5NewRestaurantFormModalModalView new
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> orderDateField [

	"<^iOf DateField>"
	"Answer the orderDateField of the receiver"

	^orderDateField
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> orderDateField: aDateField [

	"<aDateField: iOf DateField, ^self>"
	"Set the orderDateField of the receiver"

	orderDateField := aDateField
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> orderList [

	^orderList
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> orderList: aList [

	orderList := aList
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> ratingButton [

	"<^iOf Me5A>"
	"Answer the ratingButton of the receiver"

	^ratingButton
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> ratingButton: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the ratingButton of the receiver"

	ratingButton := aMe5A
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> refreshOrders [

	| aOrderCollection |
	self orderList removeAllChildren.
	aOrderCollection := self currentRestaurant getOrdersAtDate: (self orderDateField value).
	aOrderCollection isNil
		ifTrue: [self orderList addChild: (Me5MetronicListGroupItem new	title: 'Keine Bestellungen an diesem Tag...'; yourself)]
		ifFalse: [aOrderCollection do: [ :aOrder |
			self addOrder: aOrder
			].]
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> refreshRestaurants [
	
	self masterDetailList removeAllMasterDetailListGroupItems.
	MPORestaurant restaurants do: [ :aRestaurant |
		self addRestaurant: aRestaurant
	].
	self currentRestaurant: MPORestaurant restaurants first.
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantDescriptionText [

	"<^iOf Me5P>"
	"Answer the restaurantDescriptionText of the receiver"

	^restaurantDescriptionText
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantDescriptionText: aMe5P [

	"<aMe5P: iOf Me5P, ^self>"
	"Set the restaurantDescriptionText of the receiver"

	^restaurantDescriptionText := aMe5P
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantRatingText [

	"<^iOf Me5P>"
	"Answer the restaurantRatingText of the receiver"

	^restaurantRatingText
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantRatingText: aMe5P [

	"<aMe5P: iOf Me5P, ^self>"
	"Set the restaurantRatingText of the receiver"

	^restaurantRatingText := aMe5P
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> showRatingsClicked [
	self replaceView: (MPOMe5ValuationView new
		restaurant: self currentRestaurant;
		yourself)
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> websiteButton [

	"<^iOf Me5A>"
	"Answer the websiteRef of the receiver"

	^websiteButton
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> websiteButton: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the websiteButton of the receiver"

	websiteButton := aMe5A
]
