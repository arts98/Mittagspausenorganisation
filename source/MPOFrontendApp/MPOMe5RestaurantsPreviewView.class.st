Class {
	#name : 'MPOMe5RestaurantsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
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
	addChild: (self topFirstRestautant);
		addBreak20;
	addChild: (self topSecondRestautant);
		addBreak20;
	addChild: (self topThirdRestautant);
	yourself
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
