Class {
	#name : 'MPOMe5BillsPreviewView',
	#superclass : 'MPOMe5BaseView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5BillsPreviewView >> createComponents [

	self
		addChild: (Me5Section new
			text: 'Offene Rechnungen';
			yourself);
		addChild: (Me5Portlet new
			addChildToHeadTools: (Me5Button newAirDanger
				icon: (Me5I newFasInfo
				yourself);
			yourself);
			text: 'Du schuldest PersonX noch 10 Euro';
			width: '350px';
			yourself);
		yourself
]
