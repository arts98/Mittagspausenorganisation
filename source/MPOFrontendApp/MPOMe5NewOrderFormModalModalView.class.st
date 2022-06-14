Class {
	#name : 'MPOMe5NewOrderFormModalModalView',
	#superclass : 'MPOMe5RestaurantsView',
	#instVars : [
		'dateField',
		'foodTextField',
		'noteTextField',
		'priceTextField',
		'order',
		'date'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Layout' }
MPOMe5NewOrderFormModalModalView class >> layoutClass [

	"<^hOf BsBaseLayout class>"
	"Answer the receiver's layout."

	^Me5ModalViewLayout
]

{ #category : 'Initial-Events' }
MPOMe5NewOrderFormModalModalView class >> new: aOrder date: aDate [
	| theNewObject |
	theNewObject := self new.
	theNewObject order: aOrder.
	theNewObject date: aDate.
	^theNewObject
]

{ #category : 'Events' }
MPOMe5NewOrderFormModalModalView >> addOrderClicked [
	self order isNil
	ifTrue: [
		self parentView currentRestaurant addOrder: (MPOOrder new
				food: self foodTextField value;
				note: self noteTextField value;
				price: self priceTextField value;
				yourself)
			toDate: (self dateField value).
	]
	ifFalse: [
		self parentView currentRestaurant modifyOrder: (self order)
			food: (self foodTextField value)
			person: (self session person)
			oldDate: (self date)
			newDate: (self dateField value)
			note: (self noteTextField value)
			price: (self priceTextField value).
	].
	
	self parentView refreshOrders.
	self closeModal
]

{ #category : 'Initial-Events' }
MPOMe5NewOrderFormModalModalView >> createComponents [
	self modal
		title: 'Neue Bestellung';
		addChildToBody:(Me5Form new		
			addChildToBody: (dateField := Me5DateField new
				text: 'Datum';
				value: Date today;
				enableDatePicker: true;
				setDatePickerButton;
				yourself);
			addChildToBody: (foodTextField := Me5TextField new
				text: 'Essen';
				yourself);
			addChildToBody: (noteTextField := Me5TextArea new
				text: 'Extras';
				yourself);
			addChildToBody: (priceTextField := Me5TextField new
				text: 'Preis';
				helpText: 'in Euro';
				yourself);
			yourself);
			addChildToFoot: (Me5Column new
				addChild: (Me5Button newPrimary
					text: 'Ok';
					addClickEventSelector:  #addOrderClicked;
					yourself);
				addChild: (Me5Button newPrimary
					text: 'Abbrechen';
					dataDismiss: MeConstantModal;
					yourself);
				yourself);
			yourself.
			
			self order isNil
			ifFalse: [
				self dateField value: self date.
				self foodTextField value: self order food.
				self noteTextField value: self order note.
				self priceTextField value: self order price.
			] 
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> date [

	"<^iOf Date>"
	"Answer the date of the receiver"

	^date
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> date: aDate [

	"<aDate: iOf Date, ^self>"
	"Set the date of the receiver"

	date := aDate
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> dateField [

	"<^iOf DateField>"
	"Answer the dateField of the receiver"

	^dateField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> dateField: aDateField [

	"<aDateField: iOf DateField, ^self>"
	"Set the dateField of the receiver"

	^dateField := aDateField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> foodTextField [

	"<^iOf TextField>"
	"Answer the foodTextField of the receiver"

	^foodTextField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> foodTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the foodTextField of the receiver"

	^foodTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> noteTextField [

	"<^iOf TextField>"
	"Answer the noteTextField of the receiver"

	^noteTextField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> noteTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the noteTextField of the receiver"

	^noteTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> order [

	"<^iOf MPOOrder>"
	"Answer the order of the receiver"

	^order
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> order: aMPOOrder [

	"<aMPOOrder: iOf MPOOrder, ^self>"
	"Set the order of the receiver"

	order := aMPOOrder
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> priceTextField [

	"<^iOf TextField>"
	"Answer the priceTextField of the receiver"

	^priceTextField
]

{ #category : 'Accessing' }
MPOMe5NewOrderFormModalModalView >> priceTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the priceTextField of the receiver"

	^priceTextField := aTextField
]
