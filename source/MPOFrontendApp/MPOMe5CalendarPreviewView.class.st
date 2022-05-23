Class {
	#name : 'MPOMe5CalendarPreviewView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'calendar',
		'overviewPortlet'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5CalendarPreviewView >> cardClicked [

self replaceRootViewAndScrollToTop: MPOMe5CalendarView new
]

{ #category : 'Not categorized' }
MPOMe5CalendarPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			addCssClassOffset1;
			addChildToBody: ((calendar := Me5CalendarMonth new fontSize: 11)
				days: (self dayCollectionForDate: Date today);
				width: '350px';
				yourself);
			yourself);
		yourself
]

{ #category : 'Not categorized' }
MPOMe5CalendarPreviewView >> dayCollectionForDate: aDate [

| theCollection theCounter |
	theCounter := 1.
	theCollection := OrderedCollection new.
	[theCounter = 32] whileFalse: [
		theCounter > aDate daysInMonth
			ifFalse: [
				theCollection add: (Me5CalendarDay new
					date: (Date newDay: theCounter monthIndex: aDate monthIndex year: aDate year);
					setCursorToPointer;
					"addClickEventSelector: #dayClicked:;"
					yourself)].
			theCounter := theCounter + 1].
	^theCollection
]
