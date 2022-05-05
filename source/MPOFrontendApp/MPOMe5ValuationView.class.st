Class {
	#name : 'MPOMe5ValuationView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'heading',
		'sortEvaluation',
		'addComment',
		'commentForm',
		'requestComment',
		'searchField'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addComment [

	^addComment
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> addComment: anObject [

	addComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentForm [

	^commentForm
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> commentForm: anObject [

	commentForm := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> createComponents [

"LÃ¶schfunktion fÃ¼r hinzugefÃ¼gte Kommentare noch einbauen!"

self
	
		addChild: (heading := Me5H1 new
				text: 'Bewertungsview: (Restaurantname)';
				yourself);
		addBreak20;	
		addChild: (Me5Row new
		addChild: (Me5Button newLink 
				icon: (Me5I newFasStar fontSize: 30);
				color: 'orange';
				yourself);
		addChild: (Me5Button newLink 
				icon: (Me5I newFasStar fontSize: 30);
				color: 'orange';
				yourself);
		addChild: (Me5Button newLink
				icon: (Me5I newFasStar fontSize: 30);
				color: 'orange';
				yourself);
		addChild: (Me5Button newLink
				icon: (Me5I newFasStar fontSize: 30);
				color: 'black';
				yourself);
		addChild: (Me5Button newLink
		
				icon: (Me5I newFasStar fontSize: 30);
				color: 'black';
				yourself);
		"addHr;"	
		
		addChild: (Me5Form new
				addCssClassOffsetLg3;
				
				addChildToBody: (searchField := Me5TextField new
				width: '300px';
				text: 'Restautantsuche (Vergleich)';
				placeholder: 'Burger King, Subway...';
				addCssClassColLg12;
						yourself);
						
						yourself);
					yourself);
		addBreak20;
		addChild: (Me5Portlet new
				width: '1000px';
				title: ('Kommentare (7)');
				addChildToHeadTools: (Me5Form new
				addChildToBody: (sortEvaluation := Me5SelectBox new
					disableColonPostfix;
					objects: (OrderedCollection new
						add: 'Beste zuerst';
						add: 'Schlechteste zuerst';
						add: 'Aelteste zuerst';
						add: 'Neueste zuerst';
						yourself);
						yourself);
	
					yourself);
			addChildToBody: (Me5Section new
				text: 'Wie viele Sterne von 1-5 moechten Sie diesem Restaurant geben?';
				yourself);
			addChildToBodyRow: (Me5Button newLink
				icon: Me5I newFasStar;
				color: 'black';
				yourself);
			addChildToBodyRow: (Me5Button newLink
				icon: Me5I newFasStar;
				color: 'black';
				yourself);
			addChildToBodyRow: (Me5Button newLink
				icon: Me5I newFasStar;
				color: 'black';
				yourself);
			addChildToBodyRow: (Me5Button newLink
				icon: Me5I newFasStar;
				color: 'black';
				yourself);
			addChildToBodyRow: (Me5Button newLink
				icon: Me5I newFasStar;
				color: 'black';
				yourself);
			
			addChildToBody: (commentForm := Me5Form new
				addChildToBody: (Me5Row new
				
					addChild: (Me5Section new
						
							addChild: (Me5Row new
						
								addChild: (addComment := Me5TextField new
									addCssClassColLg12;
									width: '800px';
									height: '50px';
									text: 'Kommentar hinzufuegen (optional)';
									placeholder: 'Hier den Text eingeben...';
									helpText: 'Max. 0-99 Buchstaben';
								yourself);
								yourself);
								yourself);
							yourself);
						yourself);
				addBreak30ToBody;
				addChildToBody: (Me5ButtonGroup newDivided
				addChild: (Me5Row new
				addChild: (requestComment := Me5Button newSuccess
					leftIcon: Me5I newFasPaperPlane;
					text: 'Bewertung absenden';
					addClickEventSelector: #requestCommentClicked;
					yourself);
					yourself);
					yourself);
				yourself);
				
				
			yourself.
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading [

	^heading
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> heading: anObject [

	heading := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> requestComment [

	^requestComment
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> requestComment: anObject [

	requestComment := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField [

	^searchField
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> searchField: anObject [

	searchField := anObject
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortEvaluation [

	^sortEvaluation
]

{ #category : 'Not categorized' }
MPOMe5ValuationView >> sortEvaluation: anObject [

	sortEvaluation := anObject
]
