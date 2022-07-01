Class {
	#name : 'MPOMe5CalendarView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'calendar',
		'overviewPortlet',
		'chooseDaySpan',
		'dateToOrderDictionary'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Initial-Events' }
MPOMe5CalendarView >> beforeCreateComponents [

	super beforeCreateComponents.
	self dateToOrderDictionary: Dictionary new.
	(MPORestaurant restaurants collect: [ :eachR | eachR orders]) do: [ :eachDictionary |
		eachDictionary isEmptyOrNil
			ifFalse: [
				eachDictionary keysAndValuesDo: [ :eachDate :eachOrderCollection |
					self dateToOrderDictionary at: eachDate put: (OrderedCollection new
						addAll: eachOrderCollection;
						yourself)]]]
]

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

{ #category : 'Accessing' }
MPOMe5CalendarView >> dateToOrderDictionary [

	"<^hOf Dictionary: {key: iOf String, value: iOf Object}>"
	"Answer the dateToOrderDictionary of the receiver"

	^dateToOrderDictionary
]

{ #category : 'Accessing' }
MPOMe5CalendarView >> dateToOrderDictionary: aDictionary [

	"<aDictionary: hOf Dictionary: {key: iOf String, value: iOf Object}, ^self>"
	"Set the dateToOrderDictionary of the receiver"

	dateToOrderDictionary := aDictionary
]

{ #category : 'Events' }
MPOMe5CalendarView >> dayClicked: anEvent [

	| theDate theOrdersToday theSummaryString thePaymentString |

	anEvent eventBoundComponent class = Me5CalendarMonth
		ifTrue: [^self].
	theDate := anEvent eventBoundComponent date.
	theOrdersToday := self dateToOrderDictionary at: theDate ifAbsent: [].
	theSummaryString := '%1: %2'
		bindWith: theDate
		with: (theOrdersToday size isZero
			ifTrue: ['Keine Bestellungen vorhanden']
			ifFalse: [theOrdersToday printContentsStringCommaSeparatorPrintSelector: #printSummary]).
	thePaymentString := 0.
	self dateToOrderDictionary values do: [ :eachOrderCollection |
		eachOrderCollection do: [ :eachOrder |
			eachOrder person = self session person
				ifTrue: [thePaymentString := thePaymentString + eachOrder price asNumber]]].
	self chooseDaySpan hide.
	self overviewPortlet
		removeAllChildrenFromBody;
		addChildToBody: (Me5Span newWithText: ('Ausgaben im %1: %2 Euro'
			bindWith: (theDate monthNameForLocale: ClwLocale g)
			with: thePaymentString asString));
		addChildToBody: Me5Div new;
		addChildToBody: (Me5Span newWithText: theSummaryString);
		yourself
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
