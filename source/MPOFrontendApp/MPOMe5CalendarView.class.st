Class {
	#name : 'MPOMe5CalendarView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'calendar',
		'overviewPortlet',
		'chooseDaySpan'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Accessing' }
MPOMe5CalendarView >> calendar [

	^calendar
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> calendar: aMe5CalendarMonth [

	calendar := aMe5CalendarMonth
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> chooseDaySpan [

	^chooseDaySpan
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> chooseDaySpan: aMe5Span [

	chooseDaySpan := aMe5Span
]

{ #category : 'Initial-Events' }
MPOMe5CalendarView >> createComponents [
	
	self 
		addChild: (Me5Portlet new
			addChildToHeadTools: (Me5Button newButton
				text: 'Heute';
				addClickEventSelector: #currentClicked;
				yourself);
			addChildToHeadTools: (Me5FloatingIconOnlyButton newButtonIconOnly
				icon: Me5I newFasArrowLeft;
				addClickEventSelector: #previousMonthClicked;
				yourself);
			addChildToHeadTools: (Me5FloatingIconOnlyButton newButtonIconOnly
				icon: Me5I newFasArrowRight;
				addClickEventSelector: #nextMonthClicked;
				yourself);
			addChildToBody: (calendar := Me5CalendarMonth new
				days: (self dayCollectionForDate: Date today);
				width: '800px';
				addClickEventSelector: #dayClicked:;
				yourself);
			yourself);
		addChild: ((overviewPortlet := Me5Portlet newWithText: 'Uebersicht')
			addChildToBody: (chooseDaySpan := Me5Span newWithText: 'Bitte waehle einen Tag aus!');
			yourself);
		yourself
]

{ #category : 'Events' }
MPOMe5CalendarView >> currentClicked [
	
	self replaceCalendarForMonth: Date today monthIndex andYear: Date today year
]

{ #category : 'Events' }
MPOMe5CalendarView >> dayClicked: anEvent [

	self chooseDaySpan hide.
	self overviewPortlet 
		addChildToBody: (Me5Span newWithText: anEvent eventBoundComponent date)
]

{ #category : 'Internal' }
MPOMe5CalendarView >> dayCollectionForDate: aDate [

	| theCollection theCounter |
	theCounter := 1.
	theCollection := OrderedCollection new.
	[theCounter = 32] whileFalse: [
		theCounter > aDate daysInMonth
			ifFalse: [
				theCollection add: (Me5CalendarDay new
					date: (Date newDay: theCounter monthIndex: aDate monthIndex year: aDate year);
					setCursorToPointer;
					addClickEventSelector: #dayClicked:;
					yourself)].
			theCounter := theCounter + 1].
	^theCollection
]

{ #category : 'Events' }
MPOMe5CalendarView >> nextMonthClicked [

	| theCurrentMonth theCurrentYear |
	theCurrentMonth := self calendar monthIndex.
	
	theCurrentMonth = 12
		ifTrue: [
			theCurrentMonth := 1.
			theCurrentYear := self calendar year + 1]
		ifFalse: [
			theCurrentMonth := theCurrentMonth + 1.
			theCurrentYear := self calendar year].
	
	self replaceCalendarForMonth: theCurrentMonth andYear: theCurrentYear
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> overviewPortlet [

	^overviewPortlet
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> overviewPortlet: aMe5Portlet [

	overviewPortlet := aMe5Portlet
]

{ #category : 'Events' }
MPOMe5CalendarView >> previousMonthClicked [

	| theCurrentMonth theCurrentYear |
	theCurrentMonth := self calendar monthIndex.
	
	theCurrentMonth = 1
		ifTrue: [
			theCurrentMonth := 12.
			theCurrentYear := self calendar year - 1]
		ifFalse: [
			theCurrentMonth := theCurrentMonth - 1.
			theCurrentYear := self calendar year].
	
	self replaceCalendarForMonth: theCurrentMonth andYear: theCurrentYear
]

{ #category : 'Internal' }
MPOMe5CalendarView >> replaceCalendarForMonth: aMonthIndex andYear: aYear [
	
	| theNewCalendar |
	theNewCalendar := (Me5CalendarMonth new
		days: (self dayCollectionForDate: (Date newDay: 1 monthIndex: aMonthIndex year: aYear));
		width: '800px';
		yourself).
		
	self 
		replaceComponent: self calendar 
		with: theNewCalendar 
		ifAbsent: [] 
		ensure: [self calendar: theNewCalendar]
]
