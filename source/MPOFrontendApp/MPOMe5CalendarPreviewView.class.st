Class {
	#name : 'MPOMe5CalendarPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5CalendarPreviewView >> cardClicked [

self replaceRootViewAndScrollToTop: MPOMe5CalendarView new
]

{ #category : 'Not categorized' }
MPOMe5CalendarPreviewView >> createComponents [

|theCurrentDay|
theCurrentDay := MPOMe5CalendarView new.

	self
		addChild:(Me5Section new 	
			addChildToBody: ((Me5CalendarMonth new fontSize: 16)
				days: (self dayCollectionForDate: Date today);
				width: '540px';
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
					yourself)].
			theCounter := theCounter + 1].
	^theCollection
]
