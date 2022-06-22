Class {
	#name : 'MPOMe5ValuationView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading',
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
MPOMe5ValuationView >> addCommentToField: aComment [
	self masterDetailList addMasterDetailListGroupItem: (
		(self createMasterDetailListGroupItemForRating: aComment)
		enableIsActive;
		yourself)
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addRating: aRating [

	"self masterDetailList addChild: (self createMasterDetailListGroupItemForRating: aRating)"
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

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageRating [

	^averageRating
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageRating: anFloat [

	averageRating := anFloat
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageRatingStars [

	^averageRatingStars
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageRatingStars: anObject [

	averageRatingStars := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageStars [

	^averageStars
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> averageStars: anObject [

	averageStars := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> checkAverageForStarColor [

	self averageRatingStars < 1.5
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
MPOMe5ValuationView >> countingComments [

	^countingComments
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> countingComments: anObject [

	countingComments := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createComponents [

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
				text: 'Bewertungen (';
				yourself);
			addChildToMasterFormPortletHeadTools: (commentCounter :=Me5H3 new
				"text: self session counter;"
				text: self counter;
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
			"addChildToDetailFormPortletFootButtonGroup: (Me5Button newAirDanger
				icon: Me5I newFasTrash;
				addClickEventSelector: #decrementCommentCounter;
				text: 'Kommentar loeschen (Counter -1)';
				yourself);"
			yourself);
		yourself.
		
		self masterDetailList newDummyListGroupItem: (Me5MasterDetailListGroupItem new
			title: 'Neue Bewertung';
			addAfterMasterDetailListGroupItemSelectedEventSelector: #addRatingClicked:;
			itemSelectedWindowHistoryPushUrl: '?new';
			enableIsActive;
			yourself).
		
		self restaurant reviews do: [:eachReview| self masterDetailList addMasterDetailListGroupItem: (self createMasterDetailListGroupItemForRating: eachReview)]
		
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createMasterDetailListGroupItemForRating: aRating [

	^Me5MasterDetailListGroupItem new
		updateBlock: [ :theComponent | 
			theComponent text: self session person firstname, ' ', aRating starRating asString, ' Sterne'.
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
MPOMe5ValuationView >> currentRating [

	^currentRating
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> currentRating: anObject [

	currentRating := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> decrementCommentCounter [

"self session counter: (self session counter - 1).
self session counter < 0
ifTrue: [self reset].
self commentCounter text: self session counter"
											  
self countingComments: (self countingComments - 1).
self countingComments < 0
ifTrue: [self reset].
self commentCounter text: self countingComments
											  
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> deleteComment [

	self ratingCollection notNil
		ifTrue: [
		self ratingCollection remove: self. "aRating"
		self decrementCommentCounter.
		self masterDetailList removeMasterDetailListGroupItem: (self
				"enableIsActive;"
				yourself).]
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> deleteComment: anEvent [

|aRating|
aRating := anEvent componentObject.

	"self ratingCollection notNil
		ifTrue: ["
		self restaurant remove: aRating. "aRating"
		self decrementCommentCounter.
		self masterDetailList removeMasterDetailListGroupItem: (aRating
				"enableIsActive;"
				yourself).
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> deleteRatingClicked: aRating [

	|theReviews|
	self masterDetailList removeActiveMasterDetailListGroupItem.
	self restaurant deleteReview: aRating componentObject.
	
	"self ratingCollection remove: aRating componentObject."
	"self restaurant reviews: self ratingCollection." 
	theReviews := self restaurant averageRating.
	self averageRatingStars text: theReviews.
	self checkStarAverage: theReviews.
	
	self decrementCommentCounter.

	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> fifthBigStar [

	^fifthBigStar
]

{ #category : 'Not categorized' }
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
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> firstBigStar [

	^firstBigStar
]

{ #category : 'Not categorized' }
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
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> fourthBigStar [

	^fourthBigStar
]

{ #category : 'Not categorized' }
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
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading [

	^heading
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading: aString [

	heading := aString
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> incrementCommentCounter [

"self session counter: (self session counter + 1).
self commentCounter text: self session counter" "asString"

self countingComments: (self countingComments + 1).
self commentCounter text: self countingComments
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
MPOMe5ValuationView >> ratingCollection [

	^ratingCollection
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingCollection: aCollection [

	ratingCollection := aCollection
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingFromOneToFiveQuestion [

	^ratingFromOneToFiveQuestion
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingFromOneToFiveQuestion: anObject [

	ratingFromOneToFiveQuestion := anObject
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
MPOMe5ValuationView >> ratingMasterDetailGroupListItems [

	^ratingMasterDetailGroupListItems
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> ratingMasterDetailGroupListItems: anObject [

	ratingMasterDetailGroupListItems := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> refreshComments [
	self masterDetailList removeAllMasterDetailListGroupItems.
	self ratingCollection do: [ :aRating |
		self addRating: aRating
	].
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> reset [

self session counter: 0.
self commentCounter text: self session counter asString
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> restaurant [

	^restaurant
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> restaurant: aRestaurant [

	restaurant := aRestaurant
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveAverageRating: aRating [
	
	aRating
		reviews: self ratingCollection;
		averageRating;
		yourself
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> saveClickedRating [

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
	self incrementCommentCounter.
	self checkStarCount.
	self masterDetailList isNewDummyListGroupItemActive
		ifTrue: [ |theReviews theAverage theRestaurant theRating theMasterDetailListGroupItem|
			
			theRating := MPORating new.
			
			self saveRating: theRating.
			
			self restaurant addReview: theRating.
			theMasterDetailListGroupItem := self createMasterDetailListGroupItemForRating: theRating.
			
			"ratingMasterDetailGroupListItems:= self createMasterDetailListGroupItemForRating: theRating."
			"theReviews := MPORestaurant new averageRating: self averageRating commentCounter: self session counter." "Backend Methode averageRating (MPORestaurant) abgeandert in: averageRating: aRatings commentCounter: aNumber 
																																																																	^(aRatings/aNumber) asFloatD"
			self ratingCollection add: theRating.
			self restaurant reviews: self ratingCollection. "aktuelles geoeffnetes Restaurant"
						
			theReviews := self restaurant averageRating.
			self averageRatingStars text: theReviews.
						
			self masterDetailList addMasterDetailListGroupItem: (theMasterDetailListGroupItem
				enableIsActive;
				yourself).
			self checkStarAverage: theReviews.
			
			self zeroSmallStar.
			]
		ifFalse: [
			"self masterDetailList updateMasterDetailList."
			]].

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

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField [

	^searchField
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField: anObject [

	searchField := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> secondBigStar [

	^secondBigStar
]

{ #category : 'Not categorized' }
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
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
	
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
MPOMe5ValuationView >> sortByCollection [

"unvollstaendig bzw. fehlerbehaftet"
|theSortedReviews|

self masterDetailList removeAllMasterDetailListGroupItems.
	theSortedReviews := (self sortEvaluation selectedObject = 'Neueste zuerst'
		ifTrue: [self restaurant orderReviewsByTimestamp]												"self ratingCollection: theRestaurant orderReviewsByTimestamp""theRestaurant orderReviewsByTimestamp""theRestaurant:=self restaurant orderReviewsByTimestamp"
		ifFalse: [self sortEvaluation selectedObject = 'Beste zuerst'
			ifTrue: [self restaurant getSortedCommentsBasedOnRating]							"theRestaurant:=self restaurant getSortedCommentsbasedonRating"
			ifFalse: [^0]]). 
	theSortedReviews do: [:eachReview| self masterDetailList addMasterDetailListGroupItem: (self createMasterDetailListGroupItemForRating: eachReview)]
	





















"self restaurant reviews: self ratingCollection. "
"theReviews := self restaurant averageRating."
				
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortByCollection: theReviews [

"unvollstaendig bzw. fehlerbehaftet"
"|theRestaurant|
theRestaurant := MPORestaurant new."

	"self locale: ("self sortEvaluation selectedObject = 'Neueste zuerst'
		ifTrue: [theReviews orderReviewsByTimestamp"self ratingCollection: theRestaurant orderReviewsByTimestamp""theRestaurant orderReviewsByTimestamp""theRestaurant:=self restaurant orderReviewsByTimestamp"]
		ifFalse: [self sortEvaluation selectedObject = 'Beste zuerst'
			ifTrue: [theReviews getSortedCommentsBasedOnRating"theRestaurant:=self restaurant getSortedCommentsbasedonRating"]
			"ifFalse: [^0 fehlt noch]"]. 
	self replaceView
	
"self restaurant reviews: self ratingCollection. "
"theReviews := self restaurant averageRating."
				
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortCollection [

	^sortCollection
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortCollection: aCollection [

	sortCollection := aCollection
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
MPOMe5ValuationView >> starCount [

	^starCount
]

{ #category : 'Not categorized' }
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

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starsInComment [

	^starsInComment
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starsInComment: anObject [

	starsInComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> starsInCommentForm [

	self starCount = 1
	ifTrue: [starsInComment := 
		0 to: 1 do: [Me5Button new
		icon: Me5I newFasStar;
	yourself]]
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> thirdBigStar [

	^thirdBigStar
]

{ #category : 'Not categorized' }
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
	self ratingFromOneToFiveQuestion color: 'black'; text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?'.
	
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> userComments [

	^userComments
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> userComments: anObject [

	userComments := anObject
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
