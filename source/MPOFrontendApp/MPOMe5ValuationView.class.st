Class {
	#name : 'MPOMe5ValuationView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading',
		'dummy',
		'ratingMasterDetailGroupListItems',
		'starsInComment',
		'currentRating',
		'firstBigStar',
		'secondBigStar',
		'thirdBigStar',
		'fourthBigStar',
		'fifthBigStar',
		'restaurant',
		'countingComments',
		'averageRating',
		'averageStars',
		'averageRatingStars',
		'sortCollection',
		'ratingCollection',
		'ratingFromOneToFiveQuestion',
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

^Me5MPOSession 
"^MPOMe5CommentCounterSession"", MPOMe5AverageRatingSession "
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> addComment [

	^addComment
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> addComment: anObject [

	addComment := anObject
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> addCommentTextField: anObject [

	addCommentTextField := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRating: aRating [
	self masterDetailList addMasterDetailListGroupItem: (
		(self createMasterDetailListGroupItemForRating: aRating)
		enableIsActive;
		yourself)

]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRatingClicked: anEvent [

self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [self masterDetailList detailFormClearValues]
		ifFalse: [ | theComment |
			theComment := anEvent componentObject.
			self commentForm value: theComment note.
			self starCount: theComment starRating.	
			"self starsInComment: theComment starRating.	"
			
			].
			
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> averageRating [

	^averageRating
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> averageRating: anObject [

	averageRating := anObject
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> averageRatingStars [

	^averageRatingStars
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> averageRatingStars: anObject [

	averageRatingStars := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> checkStarAverage: theReview [

theReview < 1
ifTrue:[firstBigStar color: 'black'.
		secondBigStar color: 'black'.
		thirdBigStar color: 'black'.
		fourthBigStar color: 'black'.
		fifthBigStar color: 'black'.]
	ifFalse: [(theReview >=1 and:[theReview < 1.5])
		ifTrue:[firstBigStar color: 'orange'.
			secondBigStar color: 'black'.
			thirdBigStar color: 'black'.
			fourthBigStar color: 'black'.
			fifthBigStar color: 'black'.]
		ifFalse: [(theReview >=1.5 and:[theReview < 2.5])
			ifTrue: [firstBigStar color: 'orange'.
				secondBigStar color: 'orange'.
				thirdBigStar color: 'black'.
				fourthBigStar color: 'black'.
				fifthBigStar color: 'black'.]
			ifFalse: [(theReview >=2.5 and:[theReview < 3.5])
				ifTrue: [firstBigStar color: 'orange'.
					secondBigStar color: 'orange'.
					thirdBigStar color: 'orange'.
					fourthBigStar color: 'black'.
					fifthBigStar color: 'black'.]
				ifFalse: [(theReview >=3.5 and:[theReview < 4.5])
					ifTrue: [firstBigStar color: 'orange'.
						secondBigStar color: 'orange'.
						thirdBigStar color: 'orange'.
						fourthBigStar color: 'orange'.
						fifthBigStar color: 'black'.]
					ifFalse: [(theReview >=4.5 and:[theReview <= 5.0])
						ifTrue: [firstBigStar color: 'orange'.
							secondBigStar color: 'orange'.
							thirdBigStar color: 'orange'.
							fourthBigStar color: 'orange'.
							fifthBigStar color: 'orange'.]]]]]]

]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> checkStarCount [

self starCount = 1
ifTrue:[self averageRating: (self averageRating + 1)]
ifFalse: [self starCount = 2
	ifTrue: [self averageRating: (self averageRating + 2)]
	ifFalse: [self starCount = 3
		ifTrue: [self averageRating: (self averageRating + 3)]
		ifFalse: [self starCount = 4
			ifTrue: [self averageRating: (self averageRating + 4)]
			ifFalse: [self starCount = 5
				ifTrue: [self averageRating: (self averageRating + 5)]]]]]

]

{ #category : 'Accessing' }
MPOMe5ValuationView >> commentCounter [

	^commentCounter
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> commentCounter: aNumber [

	commentCounter := aNumber
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> commentForm [

	^commentForm
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> commentForm: anObject [

	commentForm := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createComponents [
|theReviews|
"Loeschfunktion fuer hinzugefuegte Kommentare noch einbauen!"

"starCount := nil."
averageRating := 0.
countingComments := 0.
ratingCollection := OrderedCollection new
yourself.
	
	self
		addChild: (heading := Me5H1 new
			text: self restaurant name;
			yourself);
		addBreak20;	
			addChild: (Me5Row new
				addChild: (firstBigStar := self starsClicked);
				addChild: (secondBigStar := self starsClicked);
				addChild: (thirdBigStar := self starsClicked);
				addChild: (fourthBigStar := self starsClicked);
				addChild: (fifthBigStar := self starsClicked);
			addChild: (averageRatingStars := Me5H1 new
				yourself);	
				"addChild: (Me5Form new
					addCssClassOffsetLg3;
					addChildToBody: (searchField := Me5TextField new
						width: '300px';
						text: 'Restautantsuche (Vergleich)';
						placeholder: 'Burger King, Subway...';
						addCssClassColLg12;
					yourself);
				yourself);"
			yourself);
		addBreak20;
		addChild: (masterDetailList := Me5MasterDetailList new
			addChildToDetailFormPortletHeadTools: (Me5H3 new
				text: 'Hier Restaurant bewerten';
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5H3 new
				text: 'Bewertungen (';
				yourself);
			addChildToMasterFormPortletHeadTools: (commentCounter :=Me5H3 new
				text: self restaurant reviews size;
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5H3 new
				text: ')';
				yourself);
			addChildToMasterFormPortletHeadTools: (Me5Form new
				addChildToBody: (sortEvaluation := Me5SelectBox new
					"makeHoverable;"
					disableColonPostfix;
					objects: ("sortCollection:="OrderedCollection new
						add: 'Schlechteste zuerst';
						add: 'Beste zuerst';
						add: 'Aelteste zuerst';
						add: 'Neueste zuerst';
					yourself);
					addChangeEventSelector: #sortByCollection;
				yourself);
			yourself);
			addChildToDetailFormPortletBody: (ratingFromOneToFiveQuestion := Me5Section new
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
						"addCssClassColSm5;"
						text: 'Kommentar hinzufuegen (optional)';
								placeholder: 'Hier den Text eingeben...';
								"helpText: 'Max. 0-99 Zeichen';"
							yourself);
						yourself);
					yourself);
			addBreak30;
			addChildToDetailFormPortletFootButtonGroup: (Me5ButtonGroup newDivided
				addChild: (Me5Row new
				addCssClassCol12;
					addChild: (sendComment := Me5A newPillSuccess"Me5Button newSuccess"
						addClickEventSelector: #saveClickedRating;
						leftIcon: Me5I newFasPaperPlane;
						text: 'Bewertung hinzufuegen';
					yourself);
				yourself);
			yourself);
			addChildToDetailFormPortletFootButtonGroup: (Me5A newPillDanger"Me5Button newAirDanger"
				addCssClassColLg12;
				icon: Me5I newFasTrash;
				addClickEventSelector: #deleteRatingClicked:;
				text: 'Kommentar loeschen';
				yourself);
			yourself);
		yourself.
		
	theReviews := self restaurant averageRating.
	self averageRatingStars text: theReviews.
	self checkStarAverage: theReviews.
	
		self masterDetailList newDummyListGroupItem: (dummy := Me5MasterDetailListGroupItem new
			"text: 'Neue Bewertung';
			color: 'black';"
			addAfterMasterDetailListGroupItemSelectedEventSelector: #addRatingClicked:;
			itemSelectedWindowHistoryPushUrl: '?new';
			enableIsActive;
			yourself).
		
		"self restaurant reviews do: [:eachReview| self createMasterDetailListGroupItemForRating: eachReview]"
		self restaurant reviews do: [:eachReview| self masterDetailList addMasterDetailListGroupItem: (self createMasterDetailListGroupItemForRating: eachReview)]
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createMasterDetailListGroupItemForRating: aRating [

	^Me5MasterDetailListGroupItem new
		updateBlock: [ :theComponent | 
			theComponent text: self session person username, ' ', aRating starRating asString, ' Sterne'.
			"theComponent title: aRating starRating asString, ' Sterne'."
			theComponent subtitle: aRating note.
		];
		addChildToRightExtension: (Me5ButtonGroup newDivided
			addChild: (Me5Button newDanger
					addCssClassBtnSm;
					icon: Me5I newFasTrash;
					addClickEventSelector: #deleteRatingClicked:;
					componentObject: aRating;
					yourself);
				yourself);
		componentObject: aRating;
		addAfterMasterDetailListGroupItemSelectedEventSelector: #addRatingClicked:;
		itemSelectedWindowHistoryPushUrl: '?',  aRating note;
		yourself
		
		
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> deleteButton [


]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> deleteRatingClicked: aRating [

	|theReviews|
	"self session person username."
	self masterDetailList removeAllMasterDetailListGroupItems.
	self restaurant deleteReview: aRating componentObject.
	theReviews := self restaurant averageRating.
	self averageRatingStars text: theReviews.
	self checkStarAverage: theReviews.
	"self dummy."
	self commentCounter text: self restaurant reviews size.
	self zeroSmallStar.
	
	self masterDetailList addMasterDetailListGroupItem: self dummy.
	self restaurant reviews do: [:eachReview| self masterDetailList addMasterDetailListGroupItem: (self createMasterDetailListGroupItemForRating: eachReview)]
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> dummy [

	^dummy
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> dummy: anObject [

	dummy := anObject
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> fifthBigStar [

	^fifthBigStar
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> fifthBigStar: anObject [

	fifthBigStar := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> fifthSmallStar [

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
	
	starCount := 5.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'orange'.
	fifthSmallStarBlack color: 'orange'.
	self dummy enableIsActive.
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> firstBigStar [

	^firstBigStar
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> firstBigStar: anObject [

	firstBigStar := anObject
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
	
	"starCount := '1 Stern'."
	starCount := 1.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'black'.
	thirdSmallStarBlack color: 'black'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
	self dummy enableIsActive.
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> fourthBigStar [

	^fourthBigStar
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> fourthBigStar: anObject [

	fourthBigStar := anObject
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
	
	starCount := 4.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'orange'.
	fifthSmallStarBlack color: 'black'.
	self dummy enableIsActive.
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> heading [

	^heading
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> heading: aString [

	heading := aString
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> masterDetailList [

	^masterDetailList
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> masterDetailList: anObject [

	masterDetailList := anObject
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> ratingFromOneToFiveQuestion [

	^ratingFromOneToFiveQuestion
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> ratingFromOneToFiveQuestion: anObject [

	ratingFromOneToFiveQuestion := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> reset [

self session counter: 0.
self commentCounter text: self session counter asString
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> restaurant [

	^restaurant
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> restaurant: aRestaurant [

	restaurant := aRestaurant
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveClickedRating [

self masterDetailList activeMasterDetailListGroupItem = self dummy
ifFalse: [
"self dummy text: 'Bitte zuerst auch diesen Bereich klicken, um eine Bewertung hinzuzufuegen.'.
self zeroSmallStar.
self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'."
self firstSmallStarBlack color: 'red'.
	self secondSmallStarBlack color: 'red'.
	self thirdSmallStarBlack color: 'red'.
	self fourthSmallStarBlack color: 'red'.
	self fifthSmallStarBlack color: 'red'.
	self ratingFromOneToFiveQuestion color: 'red'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben? Bitte klicken Sie auf einen der fuenf Sterne'.
]
ifTrue: [
self starCount notNil
	ifFalse: [
	self firstSmallStarBlack color: 'red'.
	self secondSmallStarBlack color: 'red'.
	self thirdSmallStarBlack color: 'red'.
	self fourthSmallStarBlack color: 'red'.
	self fifthSmallStarBlack color: 'red'.
	self ratingFromOneToFiveQuestion color: 'red'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben? Bitte klicken Sie auf einen der fuenf Sterne'.
	]
	ifTrue: [
	self checkStarCount.
	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [ |theReviews theAverage theRestaurant theRating theMasterDetailListGroupItem|
			
			theRating := MPORating new.
			
			self saveRating: theRating.
			theMasterDetailListGroupItem := self createMasterDetailListGroupItemForRating: theRating.
			self restaurant addReview: theRating.
			
			
			"ratingMasterDetailGroupListItems:= self createMasterDetailListGroupItemForRating: theRating."
			"theReviews := MPORestaurant new averageRating: self averageRating commentCounter: self session counter." "Backend Methode averageRating (MPORestaurant) abgeandert in: averageRating: aRatings commentCounter: aNumber 
																																																																	^(aRatings/aNumber) asFloatD"
			"self ratingCollection add: theRating.
			self restaurant reviews: self ratingCollection." "aktuelles geoeffnetes Restaurant"
						
			theReviews := self restaurant averageRating.
			self averageRatingStars text: theReviews.
						
			self masterDetailList addMasterDetailListGroupItem: (theMasterDetailListGroupItem
				"enableIsActive;"
				yourself).
			
			self checkStarAverage: theReviews.
			self commentCounter text: self restaurant reviews size.
			"self commentForm clearValues."
			self dummy enableIsActive.
			"self dummy text: 'Neue Bewertung'."			
			self zeroSmallStar.
			]
		ifFalse: [
			"self dummy color: 'red'; title: 'Klicke zuerst auf diesen Bereich, um eine Bewertung hinzuzufuegen!'."
			self masterDetailList updateMasterDetailList.
			]]].

]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveRating: aRating [
	
	aRating
		note: self commentForm value;
		starRating: self starCount;
		timestamp: AbtTimestamp now;
		"tags: self ratingCollection;"
		yourself
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> searchField [

	^searchField
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> searchField: anObject [

	searchField := anObject
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> secondBigStar [

	^secondBigStar
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> secondBigStar: anObject [

	secondBigStar := anObject
]

{ #category : 'SmallStars' }
MPOMe5ValuationView >> secondSmallStar [
	
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
	
	starCount := 2.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'black'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
	self dummy enableIsActive.
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
	
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> sendComment [

	^sendComment
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> sendComment: anObject [

	sendComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortByCollection [

"unvollstaendig bzw. fehlerbehaftet"
|theSortedReviews|

self masterDetailList removeAllMasterDetailListGroupItems.

	theSortedReviews := (self sortEvaluation selectedObject = 'Neueste zuerst'
		ifTrue: [self restaurant orderReviewsByTimestamp]												"self ratingCollection: theRestaurant orderReviewsByTimestamp""theRestaurant orderReviewsByTimestamp""theRestaurant:=self restaurant orderReviewsByTimestamp"
		ifFalse: [self sortEvaluation selectedObject = 'Beste zuerst'
			ifTrue: [self restaurant getSortedBestCommentsBasedOnRating]							"theRestaurant:=self restaurant getSortedCommentsbasedonRating"
			ifFalse: [self sortEvaluation selectedObject = 'Schlechteste zuerst'
				ifTrue:[self restaurant getSortedCommentsBasedOnRating]]]). 
	"theSortedReviews do: [:eachReview| self createMasterDetailListGroupItemForRating: eachReview]"
	self masterDetailList addMasterDetailListGroupItem: self dummy.
	theSortedReviews do: [:eachReview| self masterDetailList addMasterDetailListGroupItem: (self createMasterDetailListGroupItemForRating: eachReview)]
	





















"self restaurant reviews: self ratingCollection. "
"theReviews := self restaurant averageRating."
				
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> sortEvaluation [

	^sortEvaluation
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> sortEvaluation: anObject [

	sortEvaluation := anObject
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> starCount [

	^starCount
]

{ #category : 'Accessing' }
MPOMe5ValuationView >> starCount: anInteger [

	starCount := anInteger
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starsClicked [

	^Me5Button newLink
			icon: (smallStarsOrange := Me5I newFasStar fontSize: 30);
			color: 'black';
			yourself
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> thirdBigStar [

	^thirdBigStar
]

{ #category : 'BigStars' }
MPOMe5ValuationView >> thirdBigStar: anObject [

	thirdBigStar := anObject
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
	
	starCount := 3.
	firstSmallStarBlack color: 'orange'.
	secondSmallStarBlack color: 'orange'.
	thirdSmallStarBlack color: 'orange'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
	self dummy enableIsActive.
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> zeroSmallStar [

starCount := nil.
	firstSmallStarBlack color: 'black'.
	secondSmallStarBlack color: 'black'.
	thirdSmallStarBlack color: 'black'.
	fourthSmallStarBlack color: 'black'.
	fifthSmallStarBlack color: 'black'.
		
]
