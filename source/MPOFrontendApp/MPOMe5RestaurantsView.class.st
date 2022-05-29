Class {
	#name : 'MPOMe5RestaurantsView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'masterDetailList',
		'currentRestaurant',
		'restaurantNameField',
		'restaurantTypeField',
		'restaurantDescriptionText',
		'reviewList',
		'orderDateField',
		'orderList',
		'websiteRef',
		'menuRef',
		'addressRef'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Events' }
MPOMe5RestaurantsView >> addOrder: anOrder [
	self orderList addChild: (self createNewOrderListItem: anOrder)
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> addressRef [

	"<^iOf Me5A>"
	"Answer the addressRef of the receiver"

	^addressRef
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> addressRef: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the addressRef of the receiver"

	addressRef := aMe5A
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> addRestaurant: aRestaurant [
	self masterDetailList addMasterDetailListGroupItem: (
		(self createMasterDetailListGroupItemForRestaurant: aRestaurant)
		enableIsActive;
		yourself)
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
							addChildToBody: (restaurantDescriptionText := Me5P new
								text: 'Beschreibung';
								yourself);
							addChildToFootButtonGroup: (websiteRef := Me5A newPillPrimary
								href: 'https://www.google.com' ;
								text: 'Webseite';
								yourself);
							addChildToFootButtonGroup: (menuRef :=Me5A newPillPrimary
								href: 'https://www.google.com/finance' ;
								text: 'Speisekarte';
								yourself);
							addChildToFootButtonGroup: (addressRef := Me5A newPillPrimary
								href: 'https://www.google.de/maps/' ;
								text: 'Adresse';
								yourself);
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasStar;
						title: 'Bewertungen';
						addChildToContent: (Me5ViewHolder new
							holdingView: MPOMe5CalendarPreviewView new;
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasShoppingCart;
						title: 'Bestellungen';
						addChildToContent: (orderDateField := Me5DateField new
							addCssClassCol12;
							addCssClassColSm4;
							text: 'Datum';
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
	self currentRestaurant: MPORestaurant restaurants first.
	self refreshOrders.
	"self masterDetailList newDummyListGroupItem: (Me5MasterDetailListGroupItem new
		title: 'Neues Restaurant';
		subtitle: 'Neues Restaurant hinzufuegen.';
		addAfterMasterDetailListGroupItemSelectedEventSelector: #itemRestaurantClicked:;
		itemSelectedWindowHistoryPushUrl: '?new';
		enableIsActive;
		yourself)."

	
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
			componentObject: anOrder;
			addChildToRightExtension: (Me5ButtonGroup newDivided
				addChild: (Me5Button newPrimary
					addCssClassBtnSm;
					icon: Me5I newFasEdit;
					addClickEventSelector: #editOrderClicked:;
					yourself);
				addChild: (Me5Button newDanger
					addCssClassBtnSm;
					icon: Me5I newFasTrash;
					addClickEventSelector: #deleteOrderClicked:;
					yourself);
				yourself)
									
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> currentRestaurant [

	"<^iOf aMPORestaurant>"
	"Answer the currentRestaurant of the receiver"

	^currentRestaurant
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> currentRestaurant: anaMPORestaurant [

	"<anaMPORestaurant: iOf aMPORestaurant, ^self>"
	"Set the currentRestaurant of the receiver"

	currentRestaurant := anaMPORestaurant
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

	self showWarningNotificationWithMessage: 'Not implemented yet'
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> editOrderClicked: aMeEvent [
	self showWarningNotificationWithMessage: 'Not implemented yet'
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> editRestaurantClicked [

	self showWarningNotificationWithMessage: 'Not implemented yet'
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> itemRestaurantClicked: anEvent [

	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [self masterDetailList detailFormClearValues]
		ifFalse: [ | theRestaurant |
			theRestaurant := anEvent componentObject.
			self currentRestaurant: theRestaurant.
			self masterDetailList detailFormPortletTitle: theRestaurant name , ' ('  , theRestaurant category , ')'.
			self restaurantDescriptionText text: theRestaurant description.
			self refreshOrders.
			self websiteRef href: theRestaurant linkToWebsite.
			self menuRef href: theRestaurant linkToMenu.
			theRestaurant address isEmptyOrNil
			ifTrue: [self addressRef href: nil.] 
			ifFalse: [self addressRef href: 'https://www.google.com/maps/search/?api=1&query=', theRestaurant address.]
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
MPOMe5RestaurantsView >> menuRef [

	"<^iOf Me5A>"
	"Answer the menuRef of the receiver"

	^menuRef
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> menuRef: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the menuRef of the receiver"

	menuRef := aMe5A
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newOrderClicked [
	self openModal: MPOMe5NewOrderFormModalModalView new
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newRestaurantClicked [
	self openModal: MPOMe5NewRestaurantFormModalModalView new
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newReviewClicked [
	self replaceView: MPOMe5ValuationView new
	"self reviewList addChild: (Me5MetronicListGroupItem new
			pictureSrc: ('%1/default/dist/default/assets/app/media/img/users/100_7.jpg' bindWith: self cloudFrontDistributionFrameworkUrl);
				title: 'Bewertung';
				subtitle: 'Bewertungstext.';
				addChildToRightExtension: (Me5ButtonGroup newDivided
					addChild: (Me5Button newPrimary
						addCssClassBtnSm;
						icon: Me5I newFasEdit;
						text: 'Bearbeiten';
						addClickEventSelector: #editReviewClicked:;
						yourself);
					addChild: (Me5Button newDanger
						addCssClassBtnSm;
						icon: Me5I newFasTrash;
						text: 'Loeschen';
						addClickEventSelector: #deleteReviewClicked:;
						yourself);
					yourself);
				yourself)		"

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

{ #category : 'Internal' }
MPOMe5RestaurantsView >> refreshOrders [

	| aOrderCollection |
	self orderList removeAllChildren.
	aOrderCollection := self currentRestaurant getOrdersatDate: (self orderDateField value).
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
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantDescriptionText [

	"<^iOf Object>"
	"Answer the restaurantDescriptionTextArea of the receiver"

	^restaurantDescriptionText
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantDescriptionText: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the restaurantDescriptionTextArea of the receiver"

	restaurantDescriptionText := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantNameField [

	^restaurantNameField
	
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantNameField: anObject [

	restaurantNameField := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantTypeField [

	^restaurantTypeField
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantTypeField: anObject [

	restaurantTypeField := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> reviewList [

	^reviewList
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> reviewList: aList [

	reviewList := aList
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> saveClicked [

	self restaurantNameField hasValue
		ifFalse: [
				self restaurantNameField dangerText: 'Bitte gib einen Namen ein.']
		ifTrue: [
			self masterDetailList isNewDummyListGroupItemActive
				ifTrue: [ | theRestaurant theMasterDetailListGroupItem |
					theRestaurant := MPORestaurant new.
					self addRestaurant:  theRestaurant.
					theMasterDetailListGroupItem := self createMasterDetailListGroupItemForRestaurant: theRestaurant.
					self masterDetailList addMasterDetailListGroupItem: (theMasterDetailListGroupItem
						enableIsActive;
						yourself)]
				ifFalse: [
					self addRestaurant:  self masterDetailList activeMasterDetailListGroupItemComponentObject.
					self masterDetailList updateMasterDetailList.
					self showSuccessNotificationWithMessage: 'Saved?']]
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> websiteRef [

	"<^iOf Me5A>"
	"Answer the websiteRef of the receiver"

	^websiteRef
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> websiteRef: aMe5A [

	"<aMe5A: iOf Me5A, ^self>"
	"Set the websiteRef of the receiver"

	websiteRef := aMe5A
]
