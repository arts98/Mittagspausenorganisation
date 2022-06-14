Class {
	#name : 'MPOMe5BaseView',
	#superclass : 'Me5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'API' }
MPOMe5BaseView class >> sessionClass [

	^Me5MPOSession 
]

{ #category : 'Not categorized' }
MPOMe5BaseView >> beforeCreateComponents [
	self session hasPerson
		ifFalse: [self redirectUrl: 'http://localhost:9003/MPOMe5LoginView'. ^self].
		
	"Title"
	self pageTitle: 'Mittagspausenorganisation'.
		
	"Sidebar"
	self addItemsByPageSidebarNode: (Me5PageSidebarItemNode new
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Dashboard';
			viewClass: MPOMe5DashboardView;
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Restaurants';
			viewClass: MPOMe5RestaurantsView;
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Kalender';
			viewClass: MPOMe5CalendarView;
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Logout';
			viewClass: MPOMe5LoginView;
			yourself);
		yourself) roles: nil.
		
	
]

{ #category : 'Events' }
MPOMe5BaseView >> logOutClicked [

	self session person: nil.
	self replaceView: MPOMe5LoginView new
]
