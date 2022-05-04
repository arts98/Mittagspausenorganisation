Class {
	#name : 'MPOFrontendApp',
	#superclass : 'Application',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOFrontendApp class >> startUp [

	| theHttpServer |
theHttpServer := Me5SstHttpServer startUpHttpServerOnPort: '9003' serverApplicationClass: self.
theHttpServer 
	addViewClass: MPOMe5BaseView;
	addViewClass: MPOMe5CalendarView;
	addViewClass: MPOMe5RestaurantsView;
	addViewClass:  MPOMe5LoginView;
	addViewClass: MPOMe5RegistrationView;
	yourself
]
