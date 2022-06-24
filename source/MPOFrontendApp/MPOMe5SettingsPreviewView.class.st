Class {
	#name : 'MPOMe5SettingsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5SettingsPreviewView class >> sessionClass [

^Me5MPOSession 
]

{ #category : 'Not categorized' }
MPOMe5SettingsPreviewView >> createComponents [

	self
		addChild: (Me5H3 new
			text: 'Accountdaten:';
			yourself);
			addChild: ((Me5H2 new fontSize: 20)
				text: 'Username:', self session person username;
			yourself);
			addChild: ((Me5H2 new fontSize: 20)
				text: ('Nachname:', self session person lastname); 
			yourself);
			addChild: ((Me5H2 new fontSize: 20)
				text: 'Vorname:', self session person firstname;
			yourself);
			addChild: ((Me5H2 new fontSize: 20)
				text: 'EMail:', self session person email;
			yourself);
		yourself
]
