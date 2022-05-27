Class {
	#name : 'MPOMe5ValuationView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading',
		'starCount',
		'masterDetailList',
		'ratingList',
		'ratingListGroupItems',
		'commentCounter',
		'userComments',
		'sortEvaluation',
		'addComment',
		'addCommentExample',
		'addCommentTextField',
		'commentForm',
		'sendComment',
		'searchField',
		'starButtonColor',
		'smallStarsOrange',
		'firstSmallStarBlack',
		'secondSmallStarBlack',
		'thirdSmallStarBlack',
		'fourthSmallStarBlack',
		'fifthSmallStarBlack'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5ValuationView class >> sessionClass [

^MPOMe5CommentCounterSession  
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addComment [

	^addComment
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addComment: anObject [

	addComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addCommentTextField [

	^addCommentTextField
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addCommentTextField: anObject [

	addCommentTextField := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRatingClicked: anEvent [

self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [self masterDetailList detailFormClearValues]
		ifFalse: [ | theComment |
			theComment := anEvent componentObject.
			self commentForm value: theComment note.
			self starCount: theComment starRating.
			"self sortEvaluation value: theComment starRating."
			]
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRatingClickedTest [

^Me5MetronicListGroup new
		addClickEventSelector: #addRatingClickedTest2;
		yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRatingClickedTest2 [

^Me5MetronicListGroupItem new
				title: 'Pizza Salami2';
				yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addUserComment [

	^Me5TextArea new
			text: 'Hans Peter (Anzahl Sterne)';
			yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentCounter [

	^commentCounter
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentCounter: aNumber [

	commentCounter := aNumber
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentForm [

	^commentForm
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentForm: anObject [

	commentForm := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> counter [
	
	^0.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createComponents [

"Loeschfunktion fuer hinzugefuegte Kommentare noch einbauen!"

"starCount := 0."
	self
		addChild: (heading := Me5H1 new
			text: 'Bewertungsview: (Restaurantname)';
			yourself);
		addBreak20;	
			addChild: (Me5Row new
				addChild: self starsClicked;
				addChild: self starsClicked;
				addChild: self starsClicked;
				addChild: self starsClicked;
				addChild: self starsClicked;
				addChild: (Me5Form new
					addCssClassOffsetLg3;
					addChildToBody: (searchField := Me5TextField new
						width: '300px';
						text: 'Restautantsuche (Vergleich)';
						placeholder: 'Burger King, Subway...';
						addCssClassColLg12;
					yourself);
				yourself);
			yourself);
		addBreak20;
		addChild: (masterDetailList := Me5MasterDetailList new
			addChildToDetailFormPortletHeadTools: (Me5H3 new
				text: 'Hier Restaurant bewerten';
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5H3 new
				text: 'Kommentare (';
				yourself);
			addChildToMasterFormPortletHeadTools: (commentCounter :=Me5H3 new
				text: self session counter;
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5H3 new
				text: ')';
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5Form new
				addChildToBody: (sortEvaluation := Me5SelectBox new
					disableColonPostfix;
					objects: (OrderedCollection new
						add: 'Beste zuerst';
						add: 'Schlechteste zuerst';
						add: 'Aelteste zuerst';
						add: 'Neueste zuerst';
					yourself);
				yourself);
			yourself);
			addChildToDetailFormPortletBody: (Me5Section new
				text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?';
				yourself);
			addChildToDetailFormPortletBody: (firstSmallStarBlack := self firstSmallStar);
			addChildToDetailFormPortletBody: (secondSmallStarBlack := self secondSmallStar);
			addChildToDetailFormPortletBody: (thirdSmallStarBlack := self thirdSmallStar);
			addChildToDetailFormPortletBody: (fourthSmallStarBlack := self fourthSmallStar);
			addChildToDetailFormPortletBody: (fifthSmallStarBlack := self fifthSmallStar);
			addChildToDetailFormPortletBody: (Me5Col new
				addChild: (Me5Row new
					addChild: (commentForm := Me5TextField new
						addCssClassCol12;
						addCssClassColSm5;
						text: 'Kommentar hinzufuegen (optional)';
								placeholder: 'Hier den Text eingeben...';
								helpText: 'Max. 0-99 Zeichen';
							yourself);
						yourself);
					yourself);
			addBreak30;
			addChildToDetailFormPortletFootButtonGroup: (Me5ButtonGroup newDivided
				addChild: (Me5Row new
					addChild: (sendComment := Me5Button newSuccess
						addClickEventSelector: #saveClickedRating;
						leftIcon: Me5I newFasPaperPlane;
						text: 'Bewertung hinzufuegen';
					yourself);
				yourself);
			yourself);
			addChildToDetailFormPortletFootButtonGroup: (Me5Button newAirDanger
				icon: Me5I newFasTrash;
				addClickEventSelector: #decrementCommentCounter;
				text: 'Kommentar loeschen';
				yourself);
			yourself);
			"addChild: (userComments := Me5Form new
				addChildToBody: (Me5Accordion newSeparatedTabs
					addChild: (Me5AccordionItem new
						expand;
						icon: Me5I newFasComment;
						title: 'Benutzerkommentare';
						width: '1000px';
						addChildToContent: (Me5Portlet new
							addChildToBody: (ratingList := Me5MetronicListGroup new
								enableHoverable;
								addChild: (ratingListGroupItems :=self addRatingClickedTest);
								yourself);
							yourself);
						yourself);
					yourself);
				yourself);"
			yourself.
		
		self masterDetailList newDummyListGroupItem: (Me5MasterDetailListGroupItem new
			title: 'Neuer Kommentar';
			"subtitle: 'Anzahl Sterne';"
			addAfterMasterDetailListGroupItemSelectedEventSelector: #addRatingClicked:;
			itemSelectedWindowHistoryPushUrl: '?new';
			enableIsActive;
			yourself).
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createMasterDetailListGroupItemForRating: aRating [

	^Me5MasterDetailListGroupItem new
		updateBlock: [ :theComponent | 
			theComponent title: aRating starRating.
			theComponent subtitle: aRating note.
			"theComponent subtitle: aRating starRating"
		];
		componentObject: aRating;
		addAfterMasterDetailListGroupItemSelectedEventSelector: #addRatingClicked:;
		itemSelectedWindowHistoryPushUrl: '?',  aRating note;
		yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> decrementCommentCounter [

self session counter: (self session counter - 1).
self session counter < 0
ifTrue: [self reset].
self commentCounter text: self session counter asString

]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fifthSmallStar [

"starCount := 5."
	^Me5Button newLink
			icon: (Me5I newFasStar);
			color: 'black';
			addClickEventSelector: #fifthSmallStarsOrange;
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fifthSmallStarBlack [

	^fifthSmallStarBlack
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fifthSmallStarBlack: anObject [

	fifthSmallStarBlack := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fifthSmallStarsOrange [
	
	"starCount := commentCounter."
	"starCount := 5 asString."
	starCount := '5 Sterne'.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'orange'.
	fifthSmallStarBlack color: 'orange'.
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> firstSmallStar [

	^Me5Button newLink
			icon: (Me5I newFasStar);
			color: 'black';
			addClickEventSelector: #firstSmallStarsOrange;
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> firstSmallStarBlack [

	^firstSmallStarBlack
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> firstSmallStarBlack: anObject [

	firstSmallStarBlack := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> firstSmallStarsOrange [
	
	"starCount := 1 asString."
	starCount := '1 Stern'.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'black'.
	thirdSmallStarBlack color: 'black'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fourthSmallStar [

	^Me5Button newLink
			icon: (Me5I newFasStar);
			color: 'black';
			addClickEventSelector: #fourthSmallStarsOrange;
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fourthSmallStarBlack [

	^fourthSmallStarBlack
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fourthSmallStarBlack: anObject [

	fourthSmallStarBlack := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fourthSmallStarsOrange [
	
	"starCount := 4."
	starCount := '4 Sterne'.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'orange'.
	fifthSmallStarBlack color: 'black'.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading [

	^heading
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading: anObject [

	heading := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> incrementCommentCounter [

"self session counter: (self session counter + 1)."
self session counter: (self session counter + 1).
self commentCounter text: self session counter asString
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> masterDetailList [

	^masterDetailList
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> masterDetailList: anObject [

	masterDetailList := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingList [

	^ratingList
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingList: anObject [

	ratingList := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingListGroupItems [

	^ratingListGroupItems
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingListGroupItems: anObject [

	ratingListGroupItems := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> reset [

self session counter: 0.
self commentCounter text: self session counter asString
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveClickedRating [

	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [ | theRating theMasterDetailListGroupItem "thePerson" |
			theRating := MPORating new.
			"thePerson := MPOPerson new."
			self saveRating: theRating.
			theMasterDetailListGroupItem := self createMasterDetailListGroupItemForRating: theRating.
			self masterDetailList addMasterDetailListGroupItem: (theMasterDetailListGroupItem
				enableIsActive;
				yourself)]
		ifFalse: [
			self saveRating: self masterDetailList activeMasterDetailListGroupItemComponentObject.
			"self saveRating: self masterDetailList masterDetailListGroupComponent."
			self masterDetailList updateMasterDetailList].
	self showSuccessNotificationWithMessage: 'Kommentar hinzugefuegt'.
	self incrementCommentCounter.
	"self starCount."
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveRating: aRating [
	
	aRating
		note: self commentForm value;
		starRating: self starCount value;
		"starRating: self sortEvaluation value;"
		yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField [

	^searchField
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField: anObject [

	searchField := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> secondSmallStar [
	
	"firstSmallStarBlack = nil."
	^Me5Button newLink
			icon: (Me5I newFasStar);
			color: 'black';
			addClickEventSelector: #secondSmallStarsOrange;
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> secondSmallStarBlack [

	^secondSmallStarBlack
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> secondSmallStarBlack: anObject [

	secondSmallStarBlack := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> secondSmallStarsOrange [
	
	"starCount := 2 asString."
	starCount := '2 Sterne'.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'black'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sendComment [

	^sendComment
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sendComment: anObject [

	sendComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> smallStarsFromBlackToOrange [
	
	"Kommt evtl noch"
	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> smallStarsOrange [
	
	^smallStarsOrange
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> smallStarsOrange: anObject [

	smallStarsOrange := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortEvaluation [

	^sortEvaluation
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortEvaluation: anObject [

	sortEvaluation := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starButtonColor [

	^starButtonColor
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starButtonColor: anObject [

	starButtonColor := Me5I newFasStar color: 'orange'; yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starCount [

	^starCount
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starCount: anObject [

	starCount := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starsClicked [
 
	^Me5Button newLink
			icon: (smallStarsOrange := Me5I newFasStar fontSize: 30);
			color: 'black';
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> thirdSmallStar [

	^Me5Button newLink
			icon: (Me5I newFasStar);
			color: 'black';
			addClickEventSelector: #thirdSmallStarsOrange;
			yourself
		
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> thirdSmallStarBlack [

	^thirdSmallStarBlack
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> thirdSmallStarBlack: anObject [

	thirdSmallStarBlack := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> thirdSmallStarsOrange [
	
	"starCount := 3 asString."
	starCount := '3 Sterne'.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> userComments [

	^userComments
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> userComments: anObject [

	userComments := anObject
]
