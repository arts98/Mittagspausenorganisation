Class {
	#name : 'MPOMe5DashboardView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading',
		'restaurantView',
		'calendarView'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5DashboardView >> calendarView [

	^calendarView
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> calendarView: anObject [

	calendarView := anObject
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> cardClickedCalendar [

	self replaceRootViewAndScrollToTop: MPOMe5CalendarView new
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> createComponents [

	self
		addChild: (heading := Me5H1 new
			text: 'HR-Works Mittagspausenplaner';
			addBreak30;
			addChild: (Me5Row new
				addChild: (Me5Portlet new
					addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5RestaurantsPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '300px';
					yourself);
				addChild: (Me5Portlet new
					addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5CalendarPreviewView new;
						yourself);
					addCssClassOffset1;
					addClickEventSelector: #cardClickedCalendar;
					width: '400px';
					height: '300px';
					yourself);
				addChild: (Me5Portlet new
				addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5BillsPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '300px';
					yourself);
				addChild: (Me5Portlet new
				addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5ReminderPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '300px';
					yourself);
				addChild: (Me5Portlet new
				addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5HistoryPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '300px';
					yourself);
				addChild: (Me5Portlet new
				addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5SettingsPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '300px';
					yourself);
				yourself);
			yourself);
		yourself.
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> createPortlet [

	^Me5Portlet new 
		addCssClassOffset1;
		width: '350px';
		height: '250px';
		yourself
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> heading [

	^heading
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> heading: anObject [

	heading := anObject
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> restaurantView [

	^restaurantView
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> restaurantView: anObject [

	restaurantView := anObject
]
