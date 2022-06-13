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
		ifFalse: [self replaceView: MPOMe5LoginView new].
		
	"Title"
	self pageTitle: 'Mittagspausenorganisation'.
	
	self removeAllPageBreadcrumbItems.
	
	self addPageBreadcrumbItem:  ( Me5Button newPillDanger
		icon: Me5I newFasEject;
		addClickEventSelector: #logOutClicked;
		yourself).
	
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
			nodeTitle: 'Login (nur zum vorfuehren hier im menu)';
			viewClass: MPOMe5LoginView;
			yourself);
		yourself) roles: nil.
		
	
]

{ #category : 'Events' }
MPOMe5BaseView >> logOutClicked [

	self session person: nil.
	self replaceView: MPOMe5LoginView new
]
