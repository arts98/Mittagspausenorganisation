Class {
	#name : 'MPOMe5HistoryPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5HistoryPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			text: 'Verlauf';
			yourself);
		addChild: (Me5Portlet new
			text: 'Am Mittwoch warst du Doener essen';
			width: '350px';
			yourself);
		addChild: (Me5Portlet new
			text: 'Du hast der Pizzeria X vier Sterne gegeben';
			width: '350px';
			yourself);
		yourself
]
