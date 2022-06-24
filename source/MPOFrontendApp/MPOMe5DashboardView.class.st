Class {
	#name : 'MPOMe5DashboardView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5DashboardView >> cardClickedCalendar [

	self replaceRootViewAndScrollToTop: MPOMe5CalendarView new
]

{ #category : 'Not categorized' }
MPOMe5DashboardView >> createComponents [

	self
		addChild: (heading := Me5H1 new
			addCssClassTextCenter;
			text: 'HR-Works Mittagspausenplaner';
			addBreak30;
			addChild: (Me5Row new
				addChild: (Me5Portlet new
					addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5RestaurantsPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '600px';
					height: '400px';
					yourself);
				addChild: (Me5Portlet new
					addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5CalendarPreviewView new;
						yourself);
					addCssClassOffset1;
					addClickEventSelector: #cardClickedCalendar;
					width: '600px';
					height: '400px';
					yourself);
			
				addChild: (Me5Portlet new
				addChildToBody: (Me5PagingCardViewContainer new
						addCardView: MPOMe5SettingsPreviewView new;
						yourself);
					addCssClassOffset1;
					width: '400px';
					height: '230px';
					yourself);
				yourself);
			yourself);
		yourself.
]

{ #category : 'Accessing' }
MPOMe5DashboardView >> heading [

	^heading
]

{ #category : 'Accessing' }
MPOMe5DashboardView >> heading: anObject [

	heading := anObject
]
