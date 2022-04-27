Class {
	#name : 'MPOMe5RestaurantsView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'masterDetailList',
		'restaurantTextField',
		'restaurantShortDescriptionTextField',
		'descriptionFormGroup',
		'ordersFormPortlet'
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
						addChildToContent:  (Me5Portlet new
							addChildToBody: (descriptionFormGroup := Me5TextArea new
								text: 'Beschreibung';
								helpText: 'Hilfe-Text';
								yourself);
							addChildToFootButtonGroup: (Me5Button newPrimary
								icon: Me5I newFasHome;
								text: 'Webseite';
								yourself);
							addChildToFootButtonGroup: (Me5Button newPrimary
								icon: Me5I newFasList;
								text: 'Speisekarte';
								yourself);
							addChildToFootButtonGroup: (Me5Button newPrimary
								icon: Me5I newFasLocationArrow;
								text: 'Anfahrt';
								yourself);
							yourself);
						yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasStar;
						title: 'Bewertungen';
						addChildToContent: (Me5Portlet new
								addChildToBody: (Me5MetronicListGroup new
									enableHoverable;
									addChild: (Me5MetronicListGroupItem new
										pictureSrc: ('%1/default/dist/default/assets/app/media/img/users/100_4.jpg' bindWith: self cloudFrontDistributionFrameworkUrl);
										title: 'Top!';
										subtitle: 'Alles Top!';
										addChildToRightExtension: (Me5ButtonGroup newDivided
											addChild: (Me5Button newPrimary
												addCssClassBtnSm;
												icon: Me5I newFasEdit;
												text: 'Bearbeiten';
												yourself);
											addChild: (Me5Button newDanger
												addCssClassBtnSm;
												icon: Me5I newFasTrash;
												text: 'Loeschen';
												yourself);
											yourself);
										yourself);
									addChild: (Me5MetronicListGroupItem new
										pictureSrc: ('%1/default/dist/default/assets/app/media/img/users/100_14.jpg' bindWith: self cloudFrontDistributionFrameworkUrl);
										title: 'Super Bedienung!';
										subtitle: 'Bedienung war sehr freundlich.';
										addChildToRightExtension: (Me5ButtonGroup newDivided
											addChild: (Me5Button newPrimary
												addCssClassBtnSm;
												icon: Me5I newFasEdit;
												text: 'Bearbeiten';
												yourself);
											addChild: (Me5Button newDanger
												addCssClassBtnSm;
												icon: Me5I newFasTrash;
												text: 'Loeschen';
												yourself);
											yourself);
										yourself);
									addChild: (Me5MetronicListGroupItem new
										pictureSrc: ('%1/default/dist/default/assets/app/media/img/users/100_11.jpg' bindWith: self cloudFrontDistributionFrameworkUrl);
										title: 'Alles Super';
										subtitle: 'Macht gute Pizza.';
										addChildToRightExtension: (Me5ButtonGroup newDivided
											addChild: (Me5Button newPrimary
												addCssClassBtnSm;
												icon: Me5I newFasEdit;
												text: 'Bearbeiten';
												yourself);
											addChild: (Me5Button newDanger
												addCssClassBtnSm;
												icon: Me5I newFasTrash;
												text: 'Loeschen';
												yourself);
											yourself);
										yourself);
									yourself);
								addChildToFootButtonGroup: (Me5Button newPrimary
									icon: Me5I newFasEdit;
									text: 'Bewertung schreiben';
									yourself);
								yourself);
							yourself);
					addChild: (Me5AccordionItem new
						icon: Me5I newFasShoppingCart;
						title: 'Bestellungen';
						
							
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

{ #category : 'Events' }
MPOMe5RestaurantsView >> deleteClicked [

	self showWarningNotificationWithMessage: 'Not implemented yet'
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
