Class {
	#name : 'MPOMe5ReminderPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5ReminderPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			text: 'Erinnerungen';
			yourself);
		addChild: (Me5Portlet new
			addChildToHeadTools: (Me5Button newAirWarning
				icon: (Me5I newFasFlag
				yourself);
			yourself);
			text: 'Vergiss nicht für Donnerstag abzustimmen';
			width: '350px';
		yourself);
		addChild: (Me5Portlet new
			addChildToHeadTools: (Me5Button newAirWarning
				icon: (Me5I newFasFlag
				yourself);
			yourself);
			text: 'PersonY schuldet dir noch 10€';
			width: '350px';
		yourself);
	yourself
]
