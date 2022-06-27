Class {
	#name : 'MPOMe5RestaurantsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> backgroundColorCollection [

	^OrderedCollection 
		with: 'gold'
		with:'silver'
		with: 'brown'
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> cardClicked: aRestaurant [

MPOMe5RestaurantsPreviewView >> cardClicked: aRestaurant [

self replaceRootViewAndScrollToTop: (MPOMe5RestaurantsView new
currentRestaurant: aRestaurant componentObject;
yourself)
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			text: 'Restaurants';
			yourself);
		createRestarantCards;
		yourself
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> createRestarantCards [

	| theTopThree |

	theTopThree := self topThreeRestaurants.

	theTopThree size = 0
		ifTrue: [
			self addChild: (Me5Div new
				addChild: (Me5Img new
					src: 'https://i.ytimg.com/vi/RPeHqYs8VL0/sddefault.jpg';
					size: 250;
					yourself);
				yourself)]
		ifFalse: [
			theTopThree doWithIndex: [ :eachRestaurant :eachIndex |
				self
					addChild: ((Me5Button newPillButton fontSize: 30)
						backgroundColor: (self backgroundColorCollection at: eachIndex);
						text: ('Top %1: ' bindWith: eachIndex), eachRestaurant name;
						addClickEventSelector: #cardClicked:;
						componentObject: eachRestaurant;
						width: '540px';
						yourself);
					addBreak20;
					yourself]]
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topFirstRestautant [

self topThreeRestaurants size > 0
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'gold';
		text: 'Top 1: ', self topThreeRestaurants third name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants third;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topSecondRestautant [

self topThreeRestaurants size > 1
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'silver';
		text: 'Top 2: ', self topThreeRestaurants second name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants second;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topThirdRestautant [

self topThreeRestaurants size > 2
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'brown';
		text: 'Top 3: ', self topThreeRestaurants first name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants first;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topThreeRestaurants [

	^MPORestaurant getTopThreeRestaurants.
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topFirstRestautant [

self topThreeRestaurants size > 0
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'gold';
		text: 'Top 1: ', self topThreeRestaurants third name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants third;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topSecondRestautant [

self topThreeRestaurants size > 1
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'silver';
		text: 'Top 2: ', self topThreeRestaurants second name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants second;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topThirdRestautant [

self topThreeRestaurants size > 2
ifTrue: [
^(Me5Button newPillButton fontSize: 30)
		backgroundColor: 'brown';
		text: 'Top 3: ', self topThreeRestaurants first name;
		addClickEventSelector: #cardClicked:;
		componentObject: self topThreeRestaurants first;
		width: '540px';
		yourself
]

]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> topThreeRestaurants [

	^MPORestaurant getTopThreeRestaurants.
]
