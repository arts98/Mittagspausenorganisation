Class {
	#name : 'MPOMe5NewOrderFormModalModalView',
	#superclass : 'MPOMe5RestaurantsView',
	#category : 'MPOFrontendApp'
}

{ #category : 'Layout' }
MPOMe5NewOrderFormModalModalView class >> layoutClass [

	"<^hOf BsBaseLayout class>"
	"Answer the receiver's layout."

	^Me5ModalViewLayout
]

{ #category : 'Events' }
MPOMe5NewOrderFormModalModalView >> addOrder [
	super addOrder: (MPOOrder new)
]

{ #category : 'Events' }
MPOMe5NewOrderFormModalModalView >> addOrder: anOrder [
	super addOrder: (MPOOrder new)
]

{ #category : 'Initial-Events' }
MPOMe5NewOrderFormModalModalView >> createComponents [
	self modal
		title: 'Neue Bestellung';
		addChildToBody:(Me5Form new		
			addChildToBody: (Me5TextField new
				text: 'Essen';
				yourself);
			addChildToBody: (Me5TextArea new
				text: 'Extras';
				yourself);
			addChildToBody: (Me5RadioGroup new
				text: 'Radio Group';
				addObjects:  #('Pizzeria' 'Doener' 'Baecker' 'Fast Food' 'Asiatisch' 'Supermarkt');
				yourself);
			addChildToBody: (Me5SelectBox new
				text: 'Select Box';
				addObjects:  #('Pizzeria' 'Doener' 'Baecker' 'Fast Food' 'Asiatisch' 'Supermarkt');
				yourself);
			yourself);
			addChildToFoot: (Me5Column new
				addChild: (Me5Button newPrimary
					text: 'Ok';
					addClickEventSelector: #addOrder ;
					yourself);
				addChild: (Me5Button newPrimary
					text: 'Abbrechen';
					dataDismiss: MeConstantModal;
					yourself);
				yourself);
			yourself
]
