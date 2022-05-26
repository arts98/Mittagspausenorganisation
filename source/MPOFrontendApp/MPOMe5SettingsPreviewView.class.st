Class {
	#name : 'MPOMe5SettingsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5SettingsPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			text: 'Einstellungen';
			yourself);
		addChild: ((Me5Button newAirButton fontSize: 100)
			icon: ((Me5I newFasCogs fontSize: 100)
				yourself);
			yourself);
		yourself
]
