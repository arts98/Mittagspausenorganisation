Class {
	#name : 'MPOMe5BaseView',
	#superclass : 'Me5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5BaseView >> beforeCreateComponents [

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
			nodeTitle: 'Login (nur zum vorfuehren hier im menu)';
			viewClass: MPOMe5LoginView;
			yourself);
		yourself) roles: nil
]
