Class {
	#name : 'MPOFrontendApp',
	#superclass : 'Application',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOFrontendApp class >> startUp [

	| theHttpServer |
theHttpServer := Me5SstHttpServer startUpHttpServerOnPort: '9003' serverApplicationClass: self.
theHttpServer addViewClass: MPOMe5BaseView 
]
