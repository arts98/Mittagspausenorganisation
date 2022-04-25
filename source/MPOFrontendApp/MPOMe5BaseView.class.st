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
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Restaurantabstimmung';
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Bestellungen';
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Restaurantbewertung';
			yourself);
		addChildNode: (Me5PageSidebarItemNode new
			nodeTitle: 'Kalender';
			viewClass: MPOMe5CalendarView;
			yourself);
		yourself) roles: nil
]
