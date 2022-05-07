Class {
	#name : 'MPOMe5RestaurantsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'masterDetailList',
		'restaurantTextField',
		'orderList',
		'descriptionFormGroup',
		'reviewList'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> cardClicked [

self replaceRootViewAndScrollToTop: MPOMe5RestaurantsView new
]

{ #category : 'Not categorized' }
MPOMe5RestaurantsPreviewView >> createComponents [

self
	addChild: (Me5Section new
		text: 'Restaurants';
		yourself);
	addChild: (Me5Button new
		text: 'Restaurant Top 1';
		addClickEventSelector: #cardClicked;
		width: '350px';
		yourself);
	addBreak20;
	addChild: (Me5Button new
		text: 'Restaurant Top 2';
		addClickEventSelector: #cardClicked;
		width: '350px'; 
		yourself);
	addBreak20;
	addChild: (Me5Button new
		text: 'Restaurant Top 3';
		addClickEventSelector: #cardClicked;
		width: '350px'; 
		yourself);
	yourself
]
