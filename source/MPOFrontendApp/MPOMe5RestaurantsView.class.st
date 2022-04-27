Class {
	#name : 'MPOMe5RestaurantsView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'masterDetailList',
		'restaurantTextField',
		'restaurantShortDescriptionTextField',
		'reviewsFormPortlet'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Initial-Events' }
MPOMe5RestaurantsView >> createComponents [

	self
		addChild: (masterDetailList := Me5MasterDetailList new
			masterFormPortletTitle: 'Restaurants';
			detailFormPortletTitle: 'Restaurant';
			detailFormPortletWithInlineLabelStyle;
			addChildToMasterFormPortletHeadTools: (Me5A newIconOnlySuccess
				icon: Me5I newFasPlus;
				addClickEventSelector: #newClicked;
				yourself);
			addChildToDetailFormPortletHeadTools: (Me5A newIconOnlyDanger
				icon: Me5I newFasTrash;
				addClickEventSelector: #deleteClicked;
				yourself);
			addChildToDetailFormPortletBody: (Me5Col new
				addChild: (Me5Row new
					addChild: (restaurantTextField := Me5TextField new
						addCssClassCol12;
						addCssClassColSm6;
						leftInnerIcon: Me5I newFasEdit;
						text: 'Name';
						focus;
						yourself);
					addChild: (restaurantShortDescriptionTextField := Me5TextField new 
						addCssClassCol12;
						addCssClassColSm6;
						leftInnerIcon: Me5I newFasEdit;
						text: 'Kurzbeschreibung';
						yourself);
					yourself);
				addChild: (Me5Accordion newSeparatedTabs
					addChild: (Me5AccordionItem new
						icon: Me5I newFasInfoCircle;
						title: 'Beschreibung';
						addChildToContent: (Me5P new
							text: 'Beschreibungstext, Link zur Speisekarte, ...';
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasStar;
						title: 'Bewertungen';
						addChildToContent: (Me5P new
							"text: 'Bestellungen'"
							addChild: (reviewsFormPortlet := Me5FormPortlet new
								title: 'Bewertungen';
								yourself);
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasShoppingCart;
						title: 'Bestellungen';
						addChildToContent: (Me5P new
							text: 'Bestellungen'
							yourself);
						expand;
						yourself);
					yourself);
				yourself);
			addChildToDetailFormPortletFootButtonGroup: (Me5Button newSuccess
				icon: Me5I newFasSave;
				text: 'Speichern';
				addClickEventSelector: #saveClicked;
				yourself);
			yourself);
		yourself.

	self masterDetailList newDummyListGroupItem: (Me5MasterDetailListGroupItem new
		title: 'Neues Restaurant';
		subtitle: 'Neues Restaurant hinzufügen.';
		addAfterMasterDetailListGroupItemSelectedEventSelector: #itemClicked:;
		itemSelectedWindowHistoryPushUrl: '?new';
		enableIsActive;
		yourself).

	
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> createMasterDetailListGroupItemForRestaurant: aRestaurant [

	^Me5MasterDetailListGroupItem new
		updateBlock: [ :theComponent | theComponent title: aRestaurant name];
		subtitle: aRestaurant shortDescription;
		componentObject: aRestaurant;
		addAfterMasterDetailListGroupItemSelectedEventSelector: #itemClicked:;
		itemSelectedWindowHistoryPushUrl: '?',  aRestaurant name;
		yourself
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> createNewReviewTextFieldWithValue: aString [

	^Me5TextField new
		leftOuterIcon: Me5I newFasStar;
		placeholder: 'Super Restaurant, alles Top...';
		focus;
		addEnterKeypressEventSelector: #newReviewClicked;
		value: aString;
		rightButton: (Me5Button newDanger
			rightIcon: Me5I newFasTrash;
			addClickEventSelector: #deleteReviewClicked:;
			yourself);
		yourself
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> deleteClicked [

	self showWarningNotificationWithMessage: 'Not implemented yet'
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> deleteReviewClicked: aMeEvent [

	aMeEvent formGroup removeComponent
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> itemClicked: anEvent [

	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [self masterDetailList detailFormClearValues]
		ifFalse: [ | theRestaurant |
			theRestaurant := anEvent componentObject.
			self restaurantTextField value: theRestaurant name.
			self restaurantShortDescriptionTextField value: theRestaurant shortDescription]
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

{ #category : 'Events' }
MPOMe5RestaurantsView >> newClicked [

	self masterDetailList newDummyListGroupItem triggerClickEvent
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> newReviewClicked [

	self reviewsFormPortlet addChildToBody: (self createNewReviewTextFieldWithValue:  nil)
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantShortDescriptionTextField [

	^restaurantShortDescriptionTextField
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantShortDescriptionTextField: anObject [

	restaurantShortDescriptionTextField := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantTextField [

	^restaurantTextField
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> restaurantTextField: anObject [

	restaurantTextField := anObject
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> reviewsFormPortlet [

	^reviewsFormPortlet
]

{ #category : 'Accessing' }
MPOMe5RestaurantsView >> reviewsFormPortlet: aMe5FormPortlet [

	reviewsFormPortlet := aMe5FormPortlet
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> saveClicked [

	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [ | theRestaurant theMasterDetailListGroupItem |
			theRestaurant := MPORestaurant new.
			self saveRestaurant:  theRestaurant.
			theMasterDetailListGroupItem := self createMasterDetailListGroupItemForRestaurant: theRestaurant.
			self masterDetailList addMasterDetailListGroupItem: (theMasterDetailListGroupItem
				enableIsActive;
				yourself)]
		ifFalse: [
			self saveRestaurant:  self masterDetailList activeMasterDetailListGroupItemComponentObject.
			self masterDetailList updateMasterDetailList].
	self showSuccessNotificationWithMessage: 'Saved?'
]

{ #category : 'Internal' }
MPOMe5RestaurantsView >> saveRestaurant: aRestaurant [

	aRestaurant
		name: self restaurantTextField value;
		shortDescription: self restaurantShortDescriptionTextField value;
		yourself
]

{ #category : 'Events' }
MPOMe5RestaurantsView >> saveReviewsClicked [

	"self session reviews (self reviewsFormPortlet allFormGroups collect: [ :eachTextField | eachTextField value])."
	self showSuccessNotificationWithTitle: 'Bewertungen gespeichert!'
]
